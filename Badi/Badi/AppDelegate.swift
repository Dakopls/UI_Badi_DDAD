//
//  AppDelegate.swift
//  Badi
//
//  Created by user on 20/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

//
//  SceneDelegate.swift
//  Badi
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let router = Router()
        self.window?.rootViewController = router.home
        
        // Make this scene's window be visible.
        self.window?.makeKeyAndVisible()
        return true
    }
}
