//
//  RouterNodeSearchQuery.swift
//  Router
//
//  Created by 智子 on 2021/9/1.
//

import Foundation

public class RouterNodeSearchQueryParam: RouterNodeBaseParam  {
    /// 来源 用于打点等
    var source: String?
    /// 目标页面
    var targetType: String?
}

public class RouterNodeSearchQuery: RouterNodeAble {
    typealias ParamType = RouterNodeSearchQueryParam

    static let identifier: String? = "route_node_search_query"
    static let urlPattern: String? = "search_query"
}
