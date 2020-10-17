//
//  AppDelegate.swift
//  SiriIntentDemo
//
//  Created by Jai Ram Babu on 16/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool{
        
    
        print("***********\(String(describing: userActivity.webpageURL))*************")
        if let webURL  : URL = userActivity.webpageURL , webURL.absoluteString.count > 0 {
            let urlStr : String = webURL.absoluteString
            if urlStr.lowercased().contains("http://siriIntent/".lowercased()) {
                
                if let navigationController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController,
                    let viewController = navigationController.viewControllers.first as? ViewController {
                    let url  = urlStr.components(separatedBy: "/").last
                    let userInfo = userActivity.userInfo
                    let name = userInfo?["name"]
                    let quantity = userInfo?["quantity"]

                    viewController.updateLable("\(name ?? "")", "\(quantity ?? 0)")
                    
                }
                
            }
        }
        
        return true
    }
    

}

