//
//  RouterNodeSearchQuery.swift
//  Router
//
//  Created by 智子 on 2021/9/1.
//

import Foundation
import Router

public class RouterNodeSearchQueryParam: RouterNodeBaseParam {
    public var source: String?         //  来源
    public var targetType: String?     //  目标页面
}

public class RouterNodeSearchQuery: RouterNodeAble {
    public typealias ParamType = RouterNodeSearchQueryParam
    
    public static let identifier = "route_node_search_query"
    public static let urlPattern: String? = "search_query/"
}
