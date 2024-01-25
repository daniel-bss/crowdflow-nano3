//
//  CarriageIconView.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit

class CarriageIconView: UIView {
    
    let carriageIconView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        
        setupDottedLines()
        setupCarriageIconView()
    }
    
    private func setupDottedLines() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = self.center
        shapeLayer.strokeColor = UIColor.strokeBlue.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [1.53, 1.53]
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 8.33))
        bezierPath.addLine(to: CGPoint(x: 15.95, y: 8.33))
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.position = self.center
        shapeLayer2.strokeColor = UIColor.strokeBlue.cgColor
        shapeLayer2.lineWidth = 1
        shapeLayer2.lineDashPattern = [1.53, 1.53]
        
        let bezierPath2 = UIBezierPath()
        bezierPath2.move(to: CGPoint(x: 15.95 + 3.63 + 21.3 + 2.65, y: 8.33))
        bezierPath2.addLine(to: CGPoint(x: 15.95 + 3.63 + 21.3 + 2.65 + 15.95, y: 8.33))
        
        shapeLayer.path = bezierPath.cgPath
        shapeLayer2.path = bezierPath2.cgPath
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(shapeLayer2)
    }
    
    private func setupCarriageIconView() {
        addSubview(carriageIconView)
        
        carriageIconView.image = UIImage(systemName: "train.side.front.car")
        carriageIconView.tintColor = .darkBlue
        carriageIconView.frame = CGRect(x: 3.63 + 15.45, y: 0, width: 21.3, height: 16.24)
    }
    
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
