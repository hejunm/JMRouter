//
//  SearchQueryVC.swift
//  SearchKit
//
//  Created by wulixiwa on 2021/9/8.
//

import UIKit
import RouterNodeDefinition

class SearchQueryVC: UIViewController {

    var params: RouterNodeSearchQueryParam?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red

        self.title = params?.source
    }
}
