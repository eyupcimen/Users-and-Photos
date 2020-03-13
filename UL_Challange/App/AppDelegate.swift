//
//  AppDelegate.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit
import SVProgressHUD
import AppSpectorSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router : AppRouter!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        app.router.mainTabbarBuild()
        SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: UIScreen.main.bounds.width / 2,
        vertical: UIScreen.main.bounds.height / 2))
        
        let config = AppSpectorConfig(apiKey: "YOUR_API_KEY")
        AppSpector.run(with: config)
        
        return true
    }
}

