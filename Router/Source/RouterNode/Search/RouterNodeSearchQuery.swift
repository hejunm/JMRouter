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
    static var identifier: String?
    
    static var urlPattern: String?
    
    typealias ParamType = RouterNodeSearchQueryParam
    
}
