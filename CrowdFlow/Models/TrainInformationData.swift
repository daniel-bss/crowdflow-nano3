//
//  TrainInformationData.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 19/01/24.
//

import Foundation

struct TrainInformationData {
    
    let finalDestination: String
    let platformNumber: Int
    let startFrom: String
    let arrivingAt: String
    var cars = [TrainCar]()
    
    init(finalDestination: String, platformNumber: Int, startFrom: String, arrivingAt: String) {
        self.finalDestination = finalDestination
        self.platformNumber = platformNumber
        self.startFrom = startFrom
        self.arrivingAt = arrivingAt
        
        for i in 0..<6 {
            self.cars.append(TrainCar(id: i + 1))
        }
    }
}


