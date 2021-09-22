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
        if let paramsDict = param?.paramDic {
            setup(param, with: paramsDict)
        }
        let vc = SearchQueryVC()
        vc.title = param?.source
        vc.view.backgroundColor = UIColor.red
        return vc
    }

    // deeplink中解析出的dict参数 --> 对象中参数
    static func setup(_ param: RouterNodeParamSearchQuery?,  with dict: [String: Any]) {
        param?.source = dict["source"] as? String
    }
}

@objc(SearchKitSearchResultRouter)
public class SearchResultRouter: NSObject, RouterNodeImpAble {
    public typealias NodeDefineType = RouterNodeDefineSearchResult
    
    @objc
    public static func regist() {
        self.regist(define: RouterNodeDefineSearchResult.self)
    }
    
    public static func createDestination(param: RouterNodeParamBase?) -> String? {
        return "hello"
    }
}
