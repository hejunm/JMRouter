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

public class Router: NSObject {
    
    typealias DestinationFactoryBlock = (RouterNodeParamBase) -> Any?
    
    public static let share = Router()
    var nodeDefines = [String: DestinationFactoryBlock]()

    public func regist<NodeDefineType, NodeImpType: RouterNodeImpAble>(define: NodeDefineType.Type, imp: NodeImpType.Type) where NodeDefineType == NodeImpType.NodeDefineType {
        
        guard nodeDefines[define.identifier] == nil else {
            assertionFailure("\(define.identifier) has already registered, cannot register again")
            return
        }
        let block = { (param: RouterNodeParamBase) -> NodeDefineType.ReturnType? in
            return imp.createDestination(param: param as? NodeDefineType.ParamType)
        }
        nodeDefines[define.identifier] = block
    }
    
    public func perform<NodeDefineType: RouterNodeDefineAble>(define: NodeDefineType.Type, paramFactory: ((NodeDefineType.ParamType)->())?) -> NodeDefineType.ReturnType? {
        guard let destinationFactoryBlock = nodeDefines[define.identifier] else {
            return nil
        }
        let param = NodeDefineType.ParamType()
        paramFactory?(param)
        return destinationFactoryBlock(param) as? NodeDefineType.ReturnType
    }
}
 
