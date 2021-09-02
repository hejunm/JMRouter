//
//  Router.swift
//  RouterExample
//
//  Created by wulixiwa on 2021/7/2.
//  Copyright © 2021 wulixiwa. All rights reserved.
//

import UIKit

public class Router: NSObject {

    static let share = Router()

    func register() {
        // identifirexx --> Router
    }
}

/// RouterNodeModele
extension Router {
    static var search: RouterNodeSearchModule.Type {
        return RouterNodeSearchModule.self
    }
}
