//
//  ExtensionUIView.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import Foundation
import UIKit

extension UIView {
    
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
    
    var top: CGFloat {
        return self.frame.minY
    }
    
    var left: CGFloat {
        return self.frame.minX
    }
    
    var right: CGFloat {
        return self.left + self.width
    }
    
    var bottom: CGFloat {
        return self.top + self.frame.size.height
    }
    
    func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.35
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 3
        layer.masksToBounds = false
    }
    
}
