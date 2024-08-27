//
//  AppDelegate.swift
//  FuzeApp
//
//  Created by Thiago Monteiro on 27/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return start()
    }
}

extension AppDelegate {
    private func start() -> Bool {
        window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        return true
    }
}
