//
//  CobaCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import UIKit

class CobaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CobaCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .blue
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
