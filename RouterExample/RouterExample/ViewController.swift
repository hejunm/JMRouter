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

//        let vc = Router.share.perform(define: RouterNodeDefineSearchQuery.self) { param in
//            param.source = "zhizi"
//        }
//        let vc = Router.share.perform(url: URL(string: "zhizi://search/query?source=zhizi"))
        routerByNodeDefine()
    }
    
    func routerByNodeDefine() {
        let vc = RouterNodeDefineSearchQuery.createService { param in
            param.source = "routerByNodeDefine"
        }
        if let vc = vc {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

