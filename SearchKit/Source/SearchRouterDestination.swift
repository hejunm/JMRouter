//
//  SearchRouterDestination.swift
//  Pods-RouterExample
//
//  Created by 智子 on 2021/9/8.
//

import UIKit
import Router
import RouterNodeDefinition

public class SearchQueryRouter: RouterNodeImpAble {
    public typealias ParamType = RouterNodeParamSearchQuery

    public static func register() {
        self.register(define: RouterNodeDefineSearchQuery.self)
    }

    public static func createDestination(param: RouterNodeParamSearchQuery?) -> AnyObject? {
        let vc = SearchQueryVC()
        vc.title = param?.source
        vc.view.backgroundColor = UIColor.red
        return vc
    }
}
