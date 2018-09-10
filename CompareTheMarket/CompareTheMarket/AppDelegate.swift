//
//  AppDelegate.swift
//  CompareTheMarket
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = appAssembly.coreAssembly.wordListAssembly.viewController()
        appAssembly.navigationController.pushViewController(initialViewController, animated: false)
        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.window.makeKeyAndVisible()
        
        return true
    }
}

