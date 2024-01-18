//
//  LifestyleCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 19/01/24.
//

import UIKit

class LifestyleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LifestyleCollectionViewCell"
    
    let cardView = UIView()
    let logoImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .clear
    }
    
    public func configure(imageString: String) {
        logoImageView.image = UIImage(named: imageString)
        
        let stringNumber: Int = Int(String(imageString.split(separator: "-").last ?? "0")) ?? 0
        
        switch stringNumber {
        case 1:
            logoImageView.frame.size = CGSize(width: 39.7, height: contentView.height)
            break
        case 2:
            logoImageView.frame.size = CGSize(width: 43.52, height: contentView.height)
            break
        case 3:
            logoImageView.frame.size = CGSize(width: 36.65, height: contentView.height)
            break
        case 4:
            logoImageView.frame.size = CGSize(width: 39, height: contentView.height)
            break
        case 5:
            logoImageView.frame.size = CGSize(width: 38, height: contentView.height)
            break
        case 6:
            logoImageView.frame.size = CGSize(width: 46.03, height: contentView.height)
            break
        case 7:
            logoImageView.frame.size = CGSize(width: 55.11, height: contentView.height)
            break
        default:
            logoImageView.frame.size = CGSize(width: 45.38, height: contentView.height)
        }

        setupCardView()
    }
    
    private func setupCardView() {
        contentView.addSubview(cardView)
        cardView.addSubview(logoImageView)
        
        cardView.backgroundColor = .lightBlue
        cardView.layer.cornerRadius = 6.09
        cardView.layer.masksToBounds = true
        
        logoImageView.tintColor = .darkBlue
        logoImageView.contentMode = .scaleAspectFit
        
        cardView.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.width,
            height: contentView.width
        )
        
        logoImageView.frame = CGRect(
            x: contentView.width / 2 - logoImageView.width / 2,
            y: cardView.frame.midY - logoImageView.height / 2,
            width: logoImageView.width,
            height: logoImageView.height
        )
        
        cardView.setupShadow3()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.cardView.removeFromSuperview()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
