//
//  RouterNode.swift
//  Pods-RouterExample
//
//  Created by wulixiwa on 2021/7/4.
//  路由节点，业务方在自己组件中完成注册

/**
提供两种路由方式


 两种跳转方式：
 1， 使用url， 处理deeplink
 2，使用代码跳转

两种方式应该使用相同的参数。

 调用方式：
 url--> 简单解析 --> 使用代码跳转

url:
    注册：
        url -->  路由节点

    路由：
        通过url找到对应路由节点
        使用url生成参数Context，
        创建Destination 参数为Context

protocol:
 注册：
    protocol --> 路由节点
 路由：
    通过protocol 找到路由节点
    创建Context， 将该对象传给调用方， 调用方赋值
    创建Destination 参数为Context
 */

import Foundation

public protocol RouterNodeAble: AnyObject, RouterDestinationAble where RouterNodeType == Self {
    associatedtype ParamType: RouterNodeBaseParam
    static var identifier: String { get }
    static var urlPattern: String? { get }
}

public extension RouterNodeAble {
    static var urlPattern: String? {
        return nil
    }
}

open class RouterNodeBaseParam: NSObject {

    public var paramDic: [String: Any]?

    required public override init() {
        super.init()
    }
}

