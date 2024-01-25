//
//  Coba2ViewController.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 23/01/24.
//

import UIKit
import CocoaMQTT

class Coba2ViewController: UIViewController {

    let label = UILabel()
    let count: Int = 30
    
    var mqtt: CocoaMQTT5!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        
        setupMQTT()
        
        label.text = "\(count)"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 50),
            label.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    private func setupMQTT() {
        NotificationCenter.default.addObserver(self, selector: #selector(didActivate), name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIScene.didEnterBackgroundNotification, object: nil)
        
        var connected: Bool = false
        
        let clientID = "CrowdFlow-App" + String(ProcessInfo().processIdentifier)

        mqtt = CocoaMQTT5(clientID: clientID, host: "broker.emqx.io", port: 1883)
        
        // will message topic and connection
        mqtt.willMessage = CocoaMQTT5Message(topic: "/will", string: "dieout")
        mqtt.keepAlive = 60
        
        connected = mqtt.connect()
        if connected {
            print("Connected to the broker")
        } else {
            print("Not connected to the broker")
        }
        
        mqtt.delegate = self
    }
    
    @objc func didActivate(){
        let _ = mqtt.connect()
    }
    
    // disconnect mqtt object when enters background
    @objc func didEnterBackground(){
        mqtt.disconnect()
    }

}

struct Mantap: Codable {
    let nama: String
    let umur: Double
}

extension Coba2ViewController: CocoaMQTT5Delegate {
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didConnectAck ack: CocoaMQTTCONNACKReasonCode, connAckData: MqttDecodeConnAck?) {
        let subscriptions : [MqttSubscription] = [
            MqttSubscription(topic: "dummy-data/nc3c6s2"),
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
        let string: String = message.string!
        
        let data = string.data(using: .utf8, allowLossyConversion: false)

        let payload = try! JSONDecoder().decode(MQTTPayload.self, from: data!) as! MQTTPayload
        print(payload.car1)
        print(payload.car3)
        print(payload.car4)
        print(payload.car5)
        print(payload.car6)
        print()
        
        
        
        
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
