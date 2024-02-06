//
//  ExtensionTrainInformationVC+MQTT.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 25/01/24.
//

import Foundation
import UIKit
import CocoaMQTT

extension TrainInformationViewController: CocoaMQTT5Delegate {
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didConnectAck ack: CocoaMQTTCONNACKReasonCode, connAckData: MqttDecodeConnAck?) {
        let subscriptions : [MqttSubscription] = [
            MqttSubscription(topic: "dummy-data/nc3c6s2"),
            MqttSubscription(topic: "ultrasonic/nc3c6s2")
        ]
        
        mqtt.subscribe(subscriptions)
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishMessage message: CocoaMQTT5Message, id: UInt16) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishAck id: UInt16, pubAckData: MqttDecodePubAck?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishRec id: UInt16, pubRecData: MqttDecodePubRec?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveMessage message: CocoaMQTT5Message, id: UInt16, publishData: MqttDecodePublish?) {
        if message.topic == "dummy-data/nc3c6s2" {
            let string: String = message.string!
            
            let data = string.data(using: .utf8, allowLossyConversion: false)

            let payload = try! JSONDecoder().decode(MQTTPayload.self, from: data!)
            /*
             print("Car 1:", payload.car1.reduce(0, +))
             print("Car 3:", payload.car3.reduce(0, +))
             print("Car 4:", payload.car4.reduce(0, +))
             print("Car 5:", payload.car5.reduce(0, +))
             print("Car 6:", payload.car6.reduce(0, +))
             print()
             */
            for i in 0..<6 {
                switch i {
                case 0:
                    viewModel.carCells[0].regularSeat = payload.car1[0]
                    viewModel.carCells[0].prioritySeat = payload.car1[1]
                    viewModel.carCells[0].bicycleArea = payload.car1[2]
                    break
                case 1:
                    break
                case 2:
                    viewModel.carCells[2].regularSeat = payload.car3[0]
                    viewModel.carCells[2].prioritySeat = payload.car3[1]
                    viewModel.carCells[2].bicycleArea = payload.car3[2]
                    break
                case 3:
                    viewModel.carCells[3].regularSeat = payload.car4[0]
                    viewModel.carCells[3].prioritySeat = payload.car4[1]
                    viewModel.carCells[3].bicycleArea = payload.car4[2]
                    break
                case 4:
                    viewModel.carCells[4].regularSeat = payload.car5[0]
                    viewModel.carCells[4].prioritySeat = payload.car5[1]
                    viewModel.carCells[4].bicycleArea = payload.car5[2]
                    break
                case 5:
                    viewModel.carCells[5].regularSeat = payload.car6[0]
                    viewModel.carCells[5].prioritySeat = payload.car6[1]
                    viewModel.carCells[5].bicycleArea = payload.car6[2]
                    break
                default:
                    break
                }
            }
        } else {
            viewModel.carCells[1].regularSeat = 2 - Int(message.string ?? "2")!
        }
        
        self.collectionView.reloadData()
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didSubscribeTopics success: NSDictionary, failed: [String], subAckData: MqttDecodeSubAck?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didUnsubscribeTopics topics: [String], unsubAckData: MqttDecodeUnsubAck?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveDisconnectReasonCode reasonCode: CocoaMQTTDISCONNECTReasonCode) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveAuthReasonCode reasonCode: CocoaMQTTAUTHReasonCode) {
        
    }
    
    func mqtt5DidPing(_ mqtt5: CocoaMQTT5) {
        
    }
    
    func mqtt5DidReceivePong(_ mqtt5: CocoaMQTT5) {
        
    }
    
    func mqtt5DidDisconnect(_ mqtt5: CocoaMQTT5, withError err: Error?) {
        
    }
    
    
}

