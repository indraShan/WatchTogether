//
//  AppDelegate.swift
//  WatchTogether
//
//  Created by Indrajit on 17/01/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var coordinator: AppCoordinator!
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    let window = UIWindow(frame: UIScreen.main.bounds)
    coordinator = AppCoordinator(window)
    coordinator.start()
    window.makeKeyAndVisible()
    return true
  }
  
  
}

