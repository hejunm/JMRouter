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

// MARK: Base param
open class RouterNodeParamBase {
    public var paramDic: [String: Any]?
    required public init() {}
}
