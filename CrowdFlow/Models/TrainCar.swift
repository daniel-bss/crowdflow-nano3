//
//  TrainCar.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 21/01/24.
//

import Foundation

struct TrainCar {
    
    let id: Int
    var regularSeat: Int = 45
    var prioritySeat: Int = 15
    var bicycleArea: Int = 10
    
    init(id: Int) {
        self.id = id
        
        if id == 2 {
            self.regularSeat = 2
            self.prioritySeat = 0
            self.bicycleArea = 0
        }
    }
    
}
