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
}
