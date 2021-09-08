//
//  RouterNodeSearchQuery.swift
//  Router
//
//  Created by 智子 on 2021/9/1.
//

import Foundation
import Router

public class RouterNodeSearchQueryParam: RouterNodeBaseParam {
    var source: String?         //  来源
    var targetType: String?     //  目标页面
}

public class RouterNodeSearchQuery: RouterNodeAble {
    public typealias ParamType = RouterNodeSearchQueryParam
    
    public static let identifier: String? = "route_node_search_query"
    public static let urlPattern: String? = "search_query/"
}
