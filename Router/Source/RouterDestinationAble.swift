//
//  RouterDestinationAble.swift
//  Router
//
//  Created by wulixiwa on 2021/9/1.
//  

import Foundation

protocol RouterDestinationAble {
    associatedtype RouterParamType: RouterNodeBaseParam
    associatedtype RouterNodeType: RouterNodeAble

    /// 关联 routerNode --> RouterDestination
    /// - Parameter node: 路由节点
    static func register(node: RouterNodeType)

    /// 使用deeplink中的参数， 创建参数对象
    /// - Parameter urlParams: deeplink中的参数
    static func createParamWith(urlParams:[String: Any]?) -> RouterParamType

    /// 创建路由目的对象（viewController、service）
    /// - Parameter param: 路由参数对象
    static func builderDestination(param: RouterParamType) -> AnyObject

}

extension RouterDestinationAble {
    static func register(node: RouterNodeType) {

    }
}


