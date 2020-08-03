//
//  AppDelegate.swift
//  hus-demo
//
//  Created by Adrian Domanico on 8/2/20.
//  Copyright © 2020 Adrian Domanico. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds);
        let storyBoard = UIStoryboard(name: "Main", bundle: nil);
        self.window?.rootViewController = storyBoard.instantiateInitialViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

