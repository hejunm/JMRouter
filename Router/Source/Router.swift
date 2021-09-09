//
//  Router.swift
//  RouterExample
//
//  Created by wulixiwa on 2021/7/2.
//  Copyright © 2021 wulixiwa. All rights reserved.
//


/**
注册：  id --> RouterNodeType
获取： RouterDestinationAble?  传参、返回值
deeplink、 代码实现？
 */


import UIKit
import JLRoutes

public class Router: NSObject {
    public static let share = Router()
    var nodes: [String: AnyClass] = [:]

    public func regist<T>(node: T.Type) where T: RouterNodeAble {
        guard nodes[node.identifier] == nil else {
            assertionFailure("\(node.identifier) has already registered, cannot register again")
            return
        }
        nodes[node.identifier] = node

        guard let urlPattern = node.urlPattern else { return }

        JLRoutes.global().addRoute(urlPattern) { [weak self] params in
            guard self != nil else { return false }
            return true
        }
    }

    func createDestinationWith<T>(node: T.Type, param: [String: Any]? = nil) -> AnyObject?  where T: RouterNodeAble {
        let paramModel = node.createParamWith(paramDic: param)
        return node.createDestination(param: paramModel)
    }

    func createDestinationWith<T>(node: T.Type, param: T.ParamType) -> AnyObject? where T: RouterNodeAble {
        return node.createDestination(param: param)
    }
}
