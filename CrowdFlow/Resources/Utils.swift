//
//  Utils.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import Foundation

class Utils {
    
    static func getFormattedTimeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
}
