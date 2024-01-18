//
//  MainFeaturesCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 19/01/24.
//

import UIKit

class MainFeaturesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainFeaturesCollectionViewCell"
    
    let cardView = UIView()
    let iconImageView = UIImageView()
    let textLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .clear
    }
    
    public func configure(iconString: String, textString: String) {
        iconImageView.image = UIImage(systemName: iconString)
        textLabel.text = textString

        setupCardView()
        setupTextLabel()
    }
    
    private func setupCardView() {
        contentView.addSubview(cardView)
        cardView.addSubview(iconImageView)
        
        cardView.backgroundColor = .lightBlue
        cardView.layer.cornerRadius = 6.09
        cardView.layer.masksToBounds = true
        
        iconImageView.tintColor = .darkBlue
        iconImageView.frame.size = CGSize(width: 39, height: contentView.height)
        iconImageView.contentMode = .scaleAspectFit
        
        cardView.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.width,
            height: contentView.width
        )
        
        iconImageView.frame = CGRect(
            x: contentView.width / 2 - iconImageView.width / 2,
            y: cardView.frame.midY - iconImageView.height / 2,
            width: iconImageView.width,
            height: iconImageView.height
        )
        
        cardView.setupShadow3()
    }
    
    private func setupTextLabel() {
        contentView.addSubview(textLabel)
        
        textLabel.font = .poppinsMedium(size: 13)
        textLabel.textColor = .textBlack
        textLabel.sizeToFit()
        
        textLabel.frame = CGRect(
            x: contentView.width / 2 - textLabel.width / 2,
            y: cardView.bottom + 7.07,
            width: textLabel.width,
            height: textLabel.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.cardView.removeFromSuperview()
        self.textLabel.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
