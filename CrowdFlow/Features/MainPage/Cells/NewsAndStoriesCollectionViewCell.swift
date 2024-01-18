//
//  NewsAndStoriesCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 19/01/24.
//

import UIKit

class NewsAndStoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsAndStoriesCollectionViewCell"
    
    let imageView = UIImageView()
    let descriptionView = UIView()
    let descriptionLabel = UILabel()
    let timeDescLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .red
        
        layer.cornerRadius = 12.28
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    public func configure(imageString: String, titleString: String, timeDescString: String) {
        imageView.image = UIImage(named: imageString)
        descriptionLabel.text = titleString
        timeDescLabel.text = timeDescString
        
        setupImageView()
        setupDescriptionView(titleString: titleString)
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        imageView.frame.size = CGSize(width: contentView.width, height: (1/3) * contentView.height)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(
            x: 0,
            y: 0,
            width: 333,
            height: 180
        )
    }
    
    private func setupDescriptionView(titleString: String) {
        addSubview(descriptionView)
        descriptionView.addSubview(descriptionLabel)
        descriptionView.addSubview(timeDescLabel)
        
        descriptionView.backgroundColor = .lightBlue
        descriptionView.frame.size = CGSize(width: contentView.width, height: 79.5 + 20)
        
        descriptionLabel.font = .poppinsSemiBold(size: 14)
        descriptionLabel.numberOfLines = titleString.contains("QRIS") ? 2 : 3
        descriptionLabel.textColor = .darkBlue
        descriptionLabel.sizeToFit()
        
        timeDescLabel.font = .poppinsMedium(size: 10)
        timeDescLabel.textColor = .gray
        timeDescLabel.sizeToFit()
        
        descriptionView.frame = CGRect(
            x: 0,
            y: contentView.frame.maxY - descriptionView.height,
            width: descriptionView.width,
            height: descriptionView.height
        )
        descriptionLabel.frame = CGRect(
            x: 17,
            y: titleString.contains("QRIS") ? 15 : 9,
            width: contentView.width - (17 + 23 + 20),
            height: titleString.contains("QRIS") ? 44 : 66
        )
        timeDescLabel.frame = CGRect(
            x: 17,
            y: descriptionLabel.bottom,
            width: timeDescLabel.width,
            height: timeDescLabel.height
        )
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.removeFromSuperview()
        descriptionView.removeFromSuperview()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
