//
//  PageRouting.swift
//  Router
//
//  Created by 智子 on 2021/9/22.
//

import UIKit

public enum PageRoutingType {
    case push(fromVC: UINavigationController, animation: Bool = true)
    case present(fromVC: UIViewController, animation: Bool = true)

    static func routerTo(vc: UIViewController, type: PageRoutingType?) -> Bool {
        return false
    }

    static func getTempTopVC() -> UIViewController? {
        return nil
    }
}

extension Router {
    public static func routeTo(url: URL, type: PageRoutingType? = nil) -> Bool {
        guard let matchResult = Router.share.perform(url: url) else {
            return false
        }
        guard let toVC = matchResult.destination as? UIViewController else {
            return false
        }
        let result = PageRoutingType.routerTo(vc: toVC, type: type)
        return result
    }
}
