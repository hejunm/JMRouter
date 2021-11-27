//
//  RouterNodeImp.swift
//  Router
//
//  Created by wulixiwa on 2021/11/27.
//

import Foundation

public protocol RouterNodeImpAble: NSObject {
    associatedtype NodeDefineType: RouterNodeDefineAble
    static func regist()
    static func createDestination(param: NodeDefineType.ParamType?) -> NodeDefineType.ReturnType?
}

extension RouterNodeImpAble {
    public static func regist(define: NodeDefineType.Type) {
        Router.share.regist(define: define, imp: self)
    }
}
