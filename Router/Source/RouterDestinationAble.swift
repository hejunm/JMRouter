//
//  RouterDestinationAble.swift
//  Router
//
//  Created by wulixiwa on 2021/9/1.
//  

import Foundation

public protocol RouterDestinationAble {
    associatedtype RouterNodeType: RouterNodeAble

    static func createParamWith(urlParams:[String: Any]?) -> RouterNodeType.ParamType?

    static func createDestination(param: RouterNodeType.ParamType?) -> AnyObject?
}

public extension RouterDestinationAble {
    static func createParamWith(urlParams:[String: Any]?) -> RouterNodeType.ParamType? {
        return nil
    }
    
    static func createDestination(param: RouterNodeType.ParamType?) -> AnyObject? {
        return nil
    }
}


