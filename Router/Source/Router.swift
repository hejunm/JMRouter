//
//  Router.swift
//  RouterExample
//
//  Created by zhizi on 2021/7/2.
//  Copyright © 2021 zhizi. All rights reserved.
//

import UIKit
import JLRoutes

public class Router: NSObject {
    typealias DestinationFactoryBlock = (RouterNodeParamBase) -> Any?
    var id2ImpMap = [String: DestinationFactoryBlock]()
    var jlRouterLastMatchResult: JLRouterLastMatchResult?

    public static let share = Router()

    public func regist<NodeDefineType, NodeImpType: RouterNodeImpAble>(define: NodeDefineType.Type, imp: NodeImpType.Type) where NodeDefineType == NodeImpType.NodeDefineType {
        regist(nodeID: define.identifier, imp: imp)
        if let urlPattern = define.urlPattern {
            regist(urlPattern: urlPattern, imp: imp)
        }
    }
}

// MARK:  Router By Code
extension Router {

    func regist<NodeImpType: RouterNodeImpAble>(nodeID: String, imp: NodeImpType.Type) {
        guard !nodeID.isEmpty else {
            return
        }
        guard id2ImpMap[nodeID] == nil else {
            assertionFailure("\(nodeID) routerID has already registered, cannot register again")
            return
        }
        let block = { (param: RouterNodeParamBase) -> NodeImpType.NodeDefineType.ReturnType? in
            return imp.createDestination(param: param as? NodeImpType.NodeDefineType.ParamType)
        }
        id2ImpMap[nodeID] = block
        print("zhizi Router regist NodeID: \(nodeID) imp:\(imp)")
    }

    func perform<NodeDefineType: RouterNodeDefineAble>(define: NodeDefineType.Type, paramFactory: ((NodeDefineType.ParamType)->())?) -> NodeDefineType.ReturnType? {
        guard let destinationFactoryBlock = id2ImpMap[define.identifier] else {
            return nil
        }
        let param = NodeDefineType.ParamType()
        paramFactory?(param)
        return destinationFactoryBlock(param) as? NodeDefineType.ReturnType
    }
}

// MARK: Router By deeplink
extension Router {

    func regist<NodeImpType: RouterNodeImpAble>(urlPattern: String, imp: NodeImpType.Type) {
        let (scheme, urlPattern) = Router.getSchemeAndURLPattern(origin: urlPattern)
        guard !urlPattern.isEmpty else { return }
        let jlRouter = scheme.isEmpty ? JLRoutes.global() : JLRoutes.init(forScheme: scheme)
        jlRouter.addRoute(urlPattern) { [weak self] params in
            guard let self = self else { return false }
            let paramModel = NodeImpType.NodeDefineType.ParamType()
            paramModel.paramDic = params
            let destination = imp.createDestination(param: paramModel)
            self.jlRouterLastMatchResult = JLRouterLastMatchResult(urlParamDic:params, paramModel: paramModel, destination: destination)
            return true
        }
        print("zhizi Router regist urlPattern: \(urlPattern) imp:\(imp)")
    }

    func perform(url: URL?) -> JLRouterLastMatchResult? {
        guard let url = url else { return nil }
        self.jlRouterLastMatchResult = nil
        defer { self.jlRouterLastMatchResult = nil }
        let routerResult = JLRoutes.routeURL(url)
        guard routerResult,
              let jlRouterLastMatchResult = self.jlRouterLastMatchResult,
              let matchedURL = jlRouterLastMatchResult.urlParamDic?[JLRouteURLKey] as? NSURL, matchedURL.absoluteString == url.absoluteString else {
            return nil
        }
        return jlRouterLastMatchResult
    }

    static func getSchemeAndURLPattern(origin: String) -> (scheme: String, urlPattern: String) {
        if origin.contains("://") {
            let separatedResult = origin.components(separatedBy: "://")
            if separatedResult.count == 2 {
                return (separatedResult[0], separatedResult[1])
            } else {
                assertionFailure("\(origin) has multi '://'")
                return ("", "")
            }
        } else {
            return ("", origin)
        }
    }

    @discardableResult
    public func openPage(url: URL?, type: PageRoutingType? = nil) -> Bool {
        guard let url = url else {
            return false
        }
        guard let matchResult = perform(url: url) else {
            return false
        }
        guard let toVC = matchResult.destination as? UIViewController else {
            return false
        }
        let result = RoutingAction.routerTo(vc: toVC, type: type)
        return result
    }
}

struct JLRouterLastMatchResult {
    var urlParamDic: [String: Any]?
    var paramModel: RouterNodeParamBase?
    var destination: Any?
}
