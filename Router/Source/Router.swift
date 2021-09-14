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
    
    typealias ParamFactoryBlock = (RouterNodeParamBase) -> ()
    typealias DestinationFactoryBlock = ((ParamFactoryBlock)?) -> AnyObject?
    
    public static let share = Router()
    var nodeDefines = [String: DestinationFactoryBlock]()

    public func regist<NodeDefineType: RouterNodeDefineAble, NodeImpType: RouterNodeImpAble>(define: NodeDefineType.Type, imp: NodeImpType.Type) where NodeDefineType.ParamType == NodeImpType.ParamType {
        
        guard nodeDefines[define.identifier] == nil else {
            assertionFailure("\(define.identifier) has already registered, cannot register again")
            return
        }
        
        let block: DestinationFactoryBlock = { (paramBlock: ParamFactoryBlock?) -> AnyObject? in
            let param = NodeDefineType.ParamType()
            paramBlock?(param)
            return imp.createDestination(param: param)
        }
        
        nodeDefines[define.identifier] = block
        
    }
    
    public func perform<NodeDefineType>(nodeDefine: NodeDefineType.Type, paramFactory: ((NodeDefineType.ParamType)->())?) -> AnyObject? where NodeDefineType: RouterNodeDefineAble {
        
        guard let destinationFactoryBlock = nodeDefines[nodeDefine.identifier] else {
            return nil
        }
        
        var paramFactoryBlock: ParamFactoryBlock?
        if paramFactory != nil {
            guard let paramFactory = paramFactory as? ParamFactoryBlock else {
                return nil
            }
            paramFactoryBlock = paramFactory
        }
        return destinationFactoryBlock(paramFactoryBlock)
    }
}
