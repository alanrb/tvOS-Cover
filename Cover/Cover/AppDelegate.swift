//
//  AppDelegate.swift
//  Cover
//
//  Created by Tuong Nguyen on 3/18/19.
//  Copyright © 2019 TuongNT. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    
    var appController: TVApplicationController?
    static let TVBaseURL = "https://tvos-cover.firebaseapp.com/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"

   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let appControllerContext = TVApplicationControllerContext()
        
        guard let javaScriptURL = URL(string: AppDelegate.TVBootURL) else { fatalError("unable to create NSURL") }
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }
}

