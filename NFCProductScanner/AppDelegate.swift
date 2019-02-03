//
//  AppDelegate.swift
//  NFCProductScanner
//
//  Created by Alfian Losari on 1/26/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var productStore = ProductStore.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb else {
            return false
        }
        
        // Confirm that the NSUserActivity object contains a valid NDEF message.
        let ndefMessage = userActivity.ndefMessagePayload
        
        guard
            let record = ndefMessage.records.first,
            record.typeNameFormat == .absoluteURI || record.typeNameFormat == .nfcWellKnown,
            let payloadText = String(data: record.payload, encoding: .utf8),
            let sku = payloadText.split(separator: "/").last else {
                return false
        }
        
        guard let product = productStore.product(withID: String(sku)) else {
            return false
        }
        
        
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            return false
        }
        
        navigationController.dismiss(animated: true, completion: nil)
        let mainVC = navigationController.topViewController as? MainViewController
        mainVC?.presentProductViewController(product: product)
        return true
    }
    
  
}

