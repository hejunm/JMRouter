//
//  RouterDestinationAble.swift
//  Router
//
//  Created by wulixiwa on 2021/9/1.
//  

import Foundation

public protocol RouterDestinationAble {
    associatedtype RouterNodeType: RouterNodeAble

    static func createParamWith(paramDic: [String: Any]?) -> RouterNodeType.ParamType

    static func createDestination(param: RouterNodeType.ParamType) -> AnyObject?
}

public extension RouterDestinationAble {
    
    static func createParamWith(paramDic: [String: Any]?) -> RouterNodeType.ParamType {
        let param = RouterNodeType.ParamType()
        param.paramDic = paramDic
        return param
    }
    
    static func createDestination(param: RouterNodeType.ParamType) -> AnyObject? {
        return nil
    }
}
