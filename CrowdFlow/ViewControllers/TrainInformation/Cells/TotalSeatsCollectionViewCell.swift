//
//  TotalSeatsCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit

class TotalSeatsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TotalSeatsCollectionViewCell"
    
    let iconView = UIImageView()
    let label = UILabel()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .darkBlue
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    public func configure(carViewModel: CarCell) {
        iconView.image = UIImage(systemName: "lightbulb.fill")
        
        var totalSeats = 0
        totalSeats += carViewModel.regularSeat
        totalSeats += carViewModel.prioritySeat
        totalSeats += carViewModel.bicycleArea
        
        label.text = "\(totalSeats) Seats are Available at Car \(carViewModel.id)"
        
        setupIconView()
        setupLabel()
    }
    
    private func setupIconView() {
        contentView.addSubview(iconView)
        
        iconView.tintColor = .customWhite248
        iconView.frame.size = CGSize(width: 12, height: 27)
        iconView.contentMode = .scaleAspectFill
        
        iconView.frame = CGRect(
            x: 18,
            y: contentView.height / 2 - iconView.height / 2,
            width: iconView.width,
            height: iconView.height
        )
    }
    
    private func setupLabel() {
        contentView.addSubview(label)
        
        label.font = .poppinsSemiBold(size: 19)
        label.textColor = .customWhite248
        label.sizeToFit()
        
        label.frame = CGRect(
            x: iconView.right + 13,
            y: contentView.height / 2 - label.height / 2,
            width: label.width,
            height: label.height
        )
    }
    
    public func setupStackView() {
        contentView.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.frame.size = CGSize(width: iconView.frame.minX + label.frame.maxX, height: iconView.height)
        
        stackView.frame = CGRect(
            x: contentView.width / 2 - stackView.width / 2,
            y: contentView.height / 2 - stackView.height / 2,
            width: stackView.width,
            height: stackView.height
        )
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(label)
        iconView.frame = CGRect(
            x: 10,
            y: contentView.height / 2 - iconView.height / 2,
            width: iconView.width,
            height: iconView.height
        )
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        stackView.removeFromSuperview()
        iconView.image = nil
        label.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
