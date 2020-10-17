//
//  OrderSelectionIntentHandler.swift
//  SiriIntent
//
//  Created by Jai Ram Babu on 16/10/20.
//

import Foundation
import Intents
class OrderSelectionIntentHandler : NSObject, OrderSelectionIntentHandling {
   
    
    func resolveQuantity(for intent: OrderSelectionIntent, with completion: @escaping (OrderSelectionQuantityResolutionResult) -> Void) {
    
        if intent.quantity == nil ||  intent.quantity?.intValue ?? 0 == 0 {
            
            completion(OrderSelectionQuantityResolutionResult.needsValue())

        }else {
            completion(OrderSelectionQuantityResolutionResult.success(with: intent.quantity?.intValue ?? 0))

        }
        
    }
    
    
    func resolveOrderType(for intent: OrderSelectionIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        
        if intent.orderType == "" || intent.orderType == nil {
            
            completion(INStringResolutionResult.disambiguation(with: ["Mango","Banana","Orange"]))

        }else {
            completion(INStringResolutionResult.success(with: intent.orderType ?? ""))

        }

        
    }
    
    
    func handle(intent: OrderSelectionIntent, completion: @escaping (OrderSelectionIntentResponse) -> Void) {
        
        completion(OrderSelectionIntentResponse.init(code: .inProgress, userActivity: nil))

        
    }
    
    func confirm(intent: OrderSelectionIntent, completion: @escaping (OrderSelectionIntentResponse) -> Void) {
        
        print("http://siriIntent/\(intent.orderType ?? "")")
        
        let strUrl = "http://siriIntent/\(intent.orderType ?? "")"
        let activity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
        activity.webpageURL = URL(string: strUrl.replacingOccurrences(of: " ", with: ""))
        activity.userInfo = ["name":intent.orderType ?? "","quantity":intent.quantity ?? 0]
        completion(OrderSelectionIntentResponse.init(code: .continueInApp, userActivity: activity))
    }
    
    
}
