//
//  ViewController.swift
//  RouterExample
//
//  Created by zhizi on 2021/7/2.
//  Copyright © 2021 zhizi. All rights reserved.
//

import UIKit
import Router
import RouterNodeDefinition
import SearchKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green

        routerByNodeDefine()
        routerByNodeDefine2()
        routerByURL()
    }
    
    func routerByNodeDefine() {
        if let vc = RouterNodeDefineSearchQuery.createDestination(paramFactory: { param in param.source = "routerByNodeDefine" }) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func routerByNodeDefine2() {
        _ = RouterNodeDefineSearchQuery.openPage(paramFactory: { param in
            param.source = "routerByNodeDefine2"
        }, type: nil)
    }

    func routerByURL() {
        Router.share.openPage(url: URL(string: "zhizi://search/query?source=routerByURL"))
    }
}

