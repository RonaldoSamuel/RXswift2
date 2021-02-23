//
//  AppDelegate.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 19/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let nav = UINavigationController()
        let vc = TelaLoginViewController()
        
        nav.pushViewController(vc, animated: true)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = nav
        
        return true
    }

}

