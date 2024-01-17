//
//  TrainInformationCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 18/01/24.
//

import UIKit

class TrainInformationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TrainInformationCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .green
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        self.setupShadow2()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
