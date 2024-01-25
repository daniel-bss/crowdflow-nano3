//
//  CarsCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit

class CarsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CarsCollectionViewCell"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        
        contentView.layer.borderColor = UIColor.darkBlue.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    public func configure(carViewModel: CarCell) {
        label.text = "Car \(carViewModel.id)"
        
        if carViewModel.isTapped {
            label.textColor = .customWhite248
            contentView.backgroundColor = .darkBlue
        } else {
            label.textColor = .darkBlue
            contentView.backgroundColor = .white
        }
        
        setupLabel()
    }
    
    private func setupLabel() {
        contentView.addSubview(label)
        
        label.font = .poppinsSemiBold(size: 14)
        label.sizeToFit()
        label.frame = CGRect(x: contentView.width / 2 - label.width / 2, y: contentView.height / 2 - label.height / 2, width: label.width, height: label.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        label.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
