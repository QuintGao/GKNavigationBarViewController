//
//  AppDelegate.swift
//  GKNavigationBarViewControllerDemoSwift
//
//  Created by QuintGao on 2017/11/16.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = UINavigationController.rootVC(ViewController(), translationScale: false)
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

