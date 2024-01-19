//
//  CobaViewController.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit

class CobaViewController: UIViewController {

    let viewSaya = MantapView()
    
    func viewDidLoad2() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(viewSaya)
//        viewSaya.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        viewSaya.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewSaya.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewSaya.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewSaya.widthAnchor.constraint(equalToConstant: 100),
            viewSaya.heightAnchor.constraint(equalToConstant: 10),
        ])
    }

    var shape: CAShapeLayer?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        shape?.removeFromSuperlayer()
        drawSquare()
        print(view.subviews.count)
    }
    
    func drawSquare() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = self.view.center
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineDashPattern = [20, 10]
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 100, y: 0))
        
//        bezierPath.addLine(to: CGPoint(x: -100, y: 0))
//        bezierPath.close()
        
        shapeLayer.path = bezierPath.cgPath
            self.view.layer.addSublayer(shapeLayer)
            self.shape = shapeLayer
    }
    
}


