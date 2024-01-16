//
//  OnboardingCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .blue
    }
    
    public func configure(x: Int) {
        label.text = String(x)
        
        setupLabel()
    }
    
    private func setupLabel() {
        contentView.addSubview(label)
        
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.sizeToFit()
        
        label.frame = CGRect(
            x: contentView.width / 2 - label.width / 2,
            y: contentView.height / 2 - label.height / 2,
            width: label.width,
            height: label.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        label.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
