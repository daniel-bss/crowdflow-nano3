//
//  TrainInformationViewModel.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 21/01/24.
//

import Foundation

class TrainInformationViewModel {
    
    var finalDestination: String
    var startFrom: String
    var arrivingAt: String
    var carCells: [CarCell]
    
    init(finalDestination: String, startFrom: String, arrivingAt: String, carCells: [CarCell]) {
        self.finalDestination = finalDestination
        self.startFrom = startFrom
        self.arrivingAt = arrivingAt
        self.carCells = carCells
    }
    
    init() {
        self.finalDestination = ""
        self.startFrom = ""
        self.arrivingAt = ""
        self.carCells = [CarCell(id: 0, isTapped: false, regularSeat: 0, prioritySeat: 0, bicycleArea: 0)]
    }
}

class CarCell {
    
    let id: Int
    var isTapped: Bool
    var regularSeat: Int
    var prioritySeat: Int
    var bicycleArea: Int
    
    init(id: Int, isTapped: Bool, regularSeat: Int, prioritySeat: Int, bicycleArea: Int) {
        self.id = id
        self.isTapped = isTapped
        self.regularSeat = regularSeat
        self.prioritySeat = prioritySeat
        self.bicycleArea = bicycleArea
    }
}
