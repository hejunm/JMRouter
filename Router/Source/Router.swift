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
}

// register
extension Router {
    public func regist<T>(node: T.Type) where T: RouterNodeAble {
        guard nodes[node.identifier] == nil else {
            assertionFailure("\(node.identifier) has already registered, cannot register again")
            return
        }
        
        nodes[node.identifier] = node
        
        if let urlPattern = node.urlPattern {
            
        }
    }
}

// router
extension Router {
    
}
