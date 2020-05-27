//
//  AppDelegate.swift
//  Branch Terms
//
//  Created by Michael Horn on 5/18/20.
//  Copyright © 2020 Mike Horn. All rights reserved.
//

import UIKit
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            print(params as? [String: AnyObject] ?? {})
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
                           let branchTermDetailViewController: BranchTermDetailViewController = storyboard.instantiateViewController(withIdentifier: "BranchTermDetailViewController") as! BranchTermDetailViewController;
                           let branchTermName = params?["branch_term_name"] as! String?
                           let branchDefinition = params?["branch_definition"] as! String?
            if let unwrappedBranchTermName = branchTermName, let unwrappedBranchDefinition = branchDefinition {
                               branchTermDetailViewController.branchTermName = unwrappedBranchTermName
                               branchTermDetailViewController.branchDefinition = unwrappedBranchDefinition

                           let rootViewController = self.window!.rootViewController as! UINavigationController;
                           rootViewController.pushViewController(branchTermDetailViewController, animated: true);
            }
        
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return Branch.getInstance().application(app, open: url, options: options)
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
      // handler for Universal Links
        return Branch.getInstance().continue(userActivity)
    }

}

