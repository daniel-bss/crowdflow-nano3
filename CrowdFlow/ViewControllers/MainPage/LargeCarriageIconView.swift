//
//  LargeCarriageIconView.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 23/01/24.
//

import UIKit

class LargeCarriageIconView: UIView {
    
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
        bezierPath.move(to: CGPoint(x: 0, y: 9.65))
        bezierPath.addLine(to: CGPoint(x: 19.96, y: 9.65))
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.position = self.center
        shapeLayer2.strokeColor = UIColor.strokeBlue.cgColor
        shapeLayer2.lineWidth = 1
        shapeLayer2.lineDashPattern = [1.53, 1.53]
        
        let bezierPath2 = UIBezierPath()
        bezierPath2.move(to: CGPoint(x: 19.96 + 5 + 26.66 + 2.82, y: 9.65))
        bezierPath2.addLine(to: CGPoint(x: 19.96 + 5 + 26.66 + 2.82 + 19.96, y: 9.65))
        
        shapeLayer.path = bezierPath.cgPath
        shapeLayer2.path = bezierPath2.cgPath
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(shapeLayer2)
    }
    
    private func setupCarriageIconView() {
        addSubview(carriageIconView)
        
        carriageIconView.image = UIImage(systemName: "train.side.front.car")
        carriageIconView.tintColor = .darkBlue
        carriageIconView.frame = CGRect(x: 5 + 19.96, y: 0, width: 26.66, height: 19.05)
    }
    
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
