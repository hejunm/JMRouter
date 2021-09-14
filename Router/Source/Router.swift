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
    
    typealias DestinationFactoryBlock = (RouterNodeParamBase) -> AnyObject?
    
    public static let share = Router()
    var nodeDefines = [String: DestinationFactoryBlock]()

    public func regist<NodeDefineType: RouterNodeDefineAble, NodeImpType: RouterNodeImpAble>(define: NodeDefineType.Type, imp: NodeImpType.Type) where NodeDefineType.ParamType == NodeImpType.ParamType {
        
        guard nodeDefines[define.identifier] == nil else {
            assertionFailure("\(define.identifier) has already registered, cannot register again")
            return
        }
        let block = { (param: RouterNodeParamBase) -> AnyObject? in
            return imp.createDestination(param: param as? NodeImpType.ParamType)
        }
        nodeDefines[define.identifier] = block
    }
    
    public func perform<NodeDefineType>(define: NodeDefineType.Type, paramFactory: ((NodeDefineType.ParamType)->())?) -> AnyObject? where NodeDefineType: RouterNodeDefineAble {
        guard let destinationFactoryBlock = nodeDefines[define.identifier] else {
            return nil
        }
        let param = NodeDefineType.ParamType()
        paramFactory?(param)
        return destinationFactoryBlock(param)
    }
}
