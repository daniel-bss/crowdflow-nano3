//
//  PromotionsCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 19/01/24.
//

import UIKit

class PromotionsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromotionsCollectionViewCell"
    
    let promotionImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .clear
        setupShadow2()
    }
    
    public func configure(imageString: String) {
        contentView.addSubview(promotionImageView)
        
        promotionImageView.image = UIImage(named: imageString)
        
        promotionImageView.contentMode = .scaleAspectFill
        promotionImageView.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.width,
            height: contentView.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        promotionImageView.removeFromSuperview()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
