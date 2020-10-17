//
//  IntentHandler.swift
//  SiriIntent
//
//  Created by Jai Ram Babu on 16/10/20.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
    
        guard intent is OrderSelectionIntent else {
            fatalError("Unhandled Intent error : \(intent)")
        }
        return OrderSelectionIntentHandler()
            
    }
    
}
