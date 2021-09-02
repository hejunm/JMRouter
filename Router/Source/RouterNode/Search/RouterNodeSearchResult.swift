//
//  RouterNodeSearchResult.swift
//  Router
//
//  Created by 智子 on 2021/9/1.
//

import Foundation

public class RouterNodeSearchResultParam: RouterNodeBaseParam {
    /// 搜索词
    var keyword: String?
    
    /// 来源
    var source: String?
    
    /// 目标页面
    var targetType: String?
}

public class RouterNodeSearchResult: RouterNodeAble {
    typealias ParamType = RouterNodeSearchResultParam
    
    static let identifier: String? = "router_node_search_result"
    static let urlPattern: String? = "search_result/"
}
