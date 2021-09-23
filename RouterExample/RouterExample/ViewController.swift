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
import SearchKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green

        routerByNodeDefine()
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
    
    func routerByURL() {
        Router.routeTo(url: URL(string: "zhizi://search/query?source=routerByURL"))
    }
}

