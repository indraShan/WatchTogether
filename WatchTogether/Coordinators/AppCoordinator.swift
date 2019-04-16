//
//  AppCoordinator.swift
//  WatchTogether
//
//  Created by Indrajit on 10/03/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import Foundation

struct AppCoordinator : NavigationCoordinator {
    var window: UIWindow
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
      let homeVC = HomeViewController()
      let navController = UINavigationController(rootViewController: homeVC)
      window.rootViewController = navController;
    }
}
