//
//  AppDelegate.swift
//  sevenDayNotice
//
//  Created by WilliamCastellano on 4/12/18.
//  Copyright © 2018 WCTech. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    print(Realm.Configuration.defaultConfiguration.fileURL!)
    
    return true
  }

  class func getAppDelegate() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  func getDocDir() -> String {
    return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
  }

}

