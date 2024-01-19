//
//  MantapView.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit

class MantapView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 0)

//        UIColor.purple.setFill()
//        path.fill()

        UIColor.orange.setStroke()
        path.lineWidth = 5

        let dashPattern : [CGFloat] = [10, 4]
        path.setLineDash(dashPattern, count: 2, phase: 0)
        path.stroke()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
    }

    required init(coder: NSCoder) {
        fatalError()
    }

}
