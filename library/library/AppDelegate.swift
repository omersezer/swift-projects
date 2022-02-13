//
//  AppDelegate.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import UIKit
import SVProgressHUD
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureSVProgressHUD()
        configureIQKeyboardManager()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SplashRouterInput().view(entryEntity: SplashEntryEntity())
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func configureSVProgressHUD() {
        SVProgressHUD.setForegroundColor(.black)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2))
    }
    
    func configureIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}

