//
//  AppDelegate.swift
//  OnTheMap
//
//  Created by Azza on 6/17/19.
//  Copyright © 2019 Azza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var studentLocationList = [StudentInformation]()
    var currentUserSession: UserSession?
    var user: User?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }


}

