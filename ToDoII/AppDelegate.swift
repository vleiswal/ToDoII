//
//  AppDelegate.swift
//  ToDoII
//
//  Created by Vleis Walker on 2019/02/26.
//  Copyright © 2019 vleiswal. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("Did launch with options")
        
        // print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
        do {
            _ = try Realm()
            } catch {
            print("Error creating Realm... \(error)")
        }
    
        return true
    }

}
