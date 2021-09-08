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
    
    public static func createParamWith(urlParams: [String : Any]?) -> RouterNodeSearchQueryParam? {
        return RouterNodeSearchQueryParam()
    }
    
    public static func createDestination(param: RouterNodeSearchQueryParam?) -> AnyObject? {
        let vc = UIViewController()
        return vc
    }
    
    
}
