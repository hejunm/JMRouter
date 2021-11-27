//
//  AppDelegate.swift
//  RouterExample
//
//  Created by zhizi on 2021/7/2.
//  Copyright © 2021 zhizi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let vc = ViewController()
        let naviVC = UINavigationController(rootViewController: vc)
        window.rootViewController = naviVC
        
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

