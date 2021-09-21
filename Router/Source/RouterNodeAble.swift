//
//  RouterNode.swift
//  Pods-RouterExample
//
//  Created by wulixiwa on 2021/7/4.

import Foundation

// MARK: Define
open class RouterNodeParamBase {
    public var paramDic: [String: Any]?
    required public init() {}
}

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

// MARK: Imp
public protocol RouterNodeImpAble: AnyObject {
    associatedtype NodeDefineType: RouterNodeDefineAble
    static func regist()
    static func regist(define: NodeDefineType.Type)
    static func createDestination(param: NodeDefineType.ParamType?) -> NodeDefineType.ReturnType?
}

extension RouterNodeImpAble {
    public static func regist(define: NodeDefineType.Type) {
        Router.share.regist(define: define, imp: self)
    }
}
