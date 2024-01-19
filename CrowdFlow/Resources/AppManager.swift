//
//  AppManager.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import Foundation

class AppManager {
    
    private init() {}
    
    static let shared = AppManager()
    
    let dateNow: Date = Date.now
    var lastUpdated: Date = Date.now
    
    var didSeeOnboardingPage: Bool {
        if let didSeeOnboardingPage = UserDefaults.standard.value(forKey: "didSeeOnboardingPage") as? Bool {
            return didSeeOnboardingPage
        } else {
            return false
        }
    }
    
}
