//
//  ViewController.swift
//  RouterExample
//
//  Created by 智子 on 2021/7/2.
//  Copyright © 2021 智子. All rights reserved.
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
        let vc = RouterNodeDefineSearchQuery.createService { param in
            param.source = "routerByNodeDefine"
        }
        if let vc = vc {
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

