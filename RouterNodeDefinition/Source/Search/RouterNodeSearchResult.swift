//
//  RouterNodeSearchResult.swift
//  Router
//
//  Created by 智子 on 2021/9/1.
//

import Foundation
import Router

public class RouterNodeSearchResultParam: RouterNodeBaseParam {
    var source: String?         //  来源
    var targetType: String?     //  目标页面
}

public class RouterNodeSearchResult: RouterNodeAble {
    public typealias ParamType = RouterNodeSearchResultParam
    
    public static let identifier: String? = "router_node_search_result"
    public static let urlPattern: String? = "search_result/"
}
