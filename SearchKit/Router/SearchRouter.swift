//
//  SearchRouterDestination.swift
//  Pods-RouterExample
//
//  Created by 智子 on 2021/9/8.
//

import UIKit
import Router
import RouterNodeDefinition

@objc(SearchKitSearchQueryRouter)
public class SearchQueryRouter: NSObject, RouterNodeImpAble {
    public typealias NodeDefineType = RouterNodeDefineSearchQuery

    @objc
    public static func regist() {
        self.regist(define: RouterNodeDefineSearchQuery.self)
    }

    public static func createDestination(param: RouterNodeParamSearchQuery?) -> UIViewController? {
        let vc = SearchQueryVC()
        vc.title = param?.source
        vc.view.backgroundColor = UIColor.red
        return vc
    }
}
