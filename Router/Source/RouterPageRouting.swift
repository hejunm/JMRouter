//
//  PageRouting.swift
//  Router
//
//  Created by 智子 on 2021/9/22.
//

import UIKit

public enum PageRoutingType {
    case push(UINavigationController, Bool)
    case present(UIViewController, Bool)

    static func routerTo(vc: UIViewController, type: PageRoutingType?) -> Bool {
        if let type = type {
            switch type {
                case .push(let fromVC, let animation):
                    fromVC.pushViewController(vc, animated: animation)
                case .present(let fromVC, let animation):
                    fromVC.present(vc, animated: animation, completion: nil)
            }
            return true
        } else {
            guard let topVC = getTopVC() else {
                return false
            }
            if let naviVC = topVC.navigationController {
                naviVC.pushViewController(vc, animated: true)
            } else {
                topVC.present(vc, animated: true, completion: nil)
            }
            return true
        }
    }

    static func getTopVC() -> UIViewController? {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        return _topViewController(rootVC)
    }
    
    static func _topViewController(_ fromViewController: UIViewController?) -> UIViewController? {
        if let tabBarController = fromViewController as? UITabBarController {
            return _topViewController(tabBarController.selectedViewController)
        } else if let navigationController = fromViewController as? UINavigationController {
            return _topViewController(navigationController.visibleViewController)
        } else if let presentedViewController = fromViewController?.presentedViewController {
            return _topViewController(presentedViewController)
        } else {
            return fromViewController
        }
    }
}

extension Router {
    
    @discardableResult
    public static func routeTo(url: URL?, type: PageRoutingType? = nil) -> Bool {
        guard let url = url else {
            return false
        }
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
