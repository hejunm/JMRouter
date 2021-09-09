//
//  ViewController.swift
//  RouterExample
//
//  Created by wulixiwa on 2021/7/2.
//  Copyright © 2021 wulixiwa. All rights reserved.
//

import UIKit
import Router
import RouterNodeDefinition

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        Router.share.regist(node: RouterNodeSearchQuery.self)

    }


}

