//
//  AppDelegate.swift
//  NewsFirst
//
//  Created by  Mac on 7/26/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    class var shared: AppDelegate {
        return (UIApplication.shared.delegate as? AppDelegate) ?? AppDelegate()
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.rootViewController = LoadingScreen.getInstance()
        self.setInitialViewController()
        return true
    }
    //MARK:- Set Initial ViewController
    func setInitialViewController() {
        isDark = AppUserDefaults.isDarkMode
        let controller = HomeVC.getInstance()
        let navigation = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigation

    }
}

