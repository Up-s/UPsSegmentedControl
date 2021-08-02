//
//  AppDelegate.swift
//  UPsSegmentedControl
//
//  Created by Up-s on 08/02/2021.
//  Copyright (c) 2021 Up-s. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let navigationViewController = UINavigationController(rootViewController: ListTableViewController())
    self.window?.rootViewController = navigationViewController
    self.window?.makeKeyAndVisible()
    
    return true
  }
  
}

