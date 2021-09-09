//
//  SearchRouterDestination.swift
//  Pods-RouterExample
//
//  Created by 智子 on 2021/9/8.
//

import UIKit
import Router
import RouterNodeDefinition

extension RouterNodeSearchQuery: RouterDestinationAble {
    public typealias RouterNodeType = RouterNodeSearchQuery

    public static func createParamWith(paramDic: [String : Any]?) -> RouterNodeSearchQueryParam {
        let params = RouterNodeSearchQueryParam()
        params.source = paramDic?["source"] as? String
        params.targetType = paramDic?["target_type"] as? String
        return params
    }

    public static func createDestination(param: RouterNodeSearchQueryParam) -> AnyObject? {
        let vc = SearchQueryVC()
        vc.params = param        
        return vc
    }
}
