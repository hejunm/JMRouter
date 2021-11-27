//
//  RouterNodeDefine.swift
//  Router
//
//  Created by wulixiwa on 2021/11/27.
//

public protocol RouterNodeDefineAble: AnyObject {
    associatedtype ParamType: RouterNodeParamBase
    associatedtype ReturnType
    static var identifier: String { get }
    static var urlPattern: String? { get }
}

public extension RouterNodeDefineAble {
    static var identifier: String {
        NSStringFromClass(self)
    }
    static var urlPattern: String? {
        return nil
    }
}

public extension RouterNodeDefineAble {
    static func createService(paramFactory: ((Self.ParamType)->())?) -> Self.ReturnType? {
        return Router.share.perform(define: Self.self, paramFactory: paramFactory)
    }

    static func openPage(paramFactory: ((Self.ParamType)->())?, type: PageRoutingType? = nil) -> Bool where ReturnType: UIViewController {
        guard let toVC = Router.share.perform(define: Self.self, paramFactory: paramFactory) else {
            return false
        }
        let result = RoutingAction.routerTo(vc: toVC, type: type)
        return result
    }
}

// MARK: RouterNodeParamBase --
open class RouterNodeParamBase {
    public var paramDic: [String: Any]?
    required public init() {}
}
