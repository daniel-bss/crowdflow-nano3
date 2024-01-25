//
//  OnboardingCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
    }
    
    public func configure(content: OnboardingContent) {
        imageView.image = UIImage(named: content.imageString)
        titleLabel.text = content.title
        subTitleLabel.text = content.subTitle
        
        setupImageView()
        setupTitleLabel()
        setupSubTitleLabel()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        imageView.frame.size = CGSize(width: 292.85, height: 271)
        imageView.contentMode = .scaleAspectFill
        
        imageView.frame = CGRect(
            x: contentView.width / 2 - imageView.width / 2,
            y: 0,
            width: imageView.width,
            height: imageView.height
        )
    }

    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.font = .poppinsSemiBold(size: 17)
        titleLabel.textColor = .darkBlue
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.frame.size = CGSize(width: 292, height: 48)
        
        titleLabel.frame = CGRect(
            x: contentView.width / 2 - titleLabel.width / 2,
            y: imageView.bottom + 19.38,
            width: titleLabel.width,
            height: titleLabel.height
        )
    }
    
    private func setupSubTitleLabel() {
        addSubview(subTitleLabel)
        
        subTitleLabel.font = .poppinsRegular(size: 14)
        subTitleLabel.textColor = .darkBlue
        subTitleLabel.numberOfLines = 3
        subTitleLabel.textAlignment = .center
        subTitleLabel.frame.size = CGSize(width: 300, height: 66)
        
        subTitleLabel.frame = CGRect(
            x: contentView.width / 2 - subTitleLabel.width / 2,
            y: titleLabel.bottom + 16,
            width: subTitleLabel.width,
            height: subTitleLabel.height
        )
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
