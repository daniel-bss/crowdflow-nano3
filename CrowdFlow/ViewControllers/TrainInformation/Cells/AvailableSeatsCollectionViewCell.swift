//
//  AvailableSeatsCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit

class AvailableSeatsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AvailableSeatsCollectionViewCell"
    
    let stackView: UIStackView? = UIStackView()
    let regularSeatLabel: UILabel = {
        let label = UILabel()
        label.font = .poppinsRegular(size: 11.58)
        label.textColor = .black
        return label
    }()
    
    let prioritySeatLabel: UILabel = {
        let label = UILabel()
        label.font = .poppinsRegular(size: 11.58)
        label.textColor = .black
        return label
    }()
    
    let bicycleAreaLabel: UILabel = {
        let label = UILabel()
        label.font = .poppinsRegular(size: 11.58)
        label.textColor = .black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
    }
    
    public func configure(carViewModel: CarCell) {
        regularSeatLabel.text = String(format: NSLocalizedString("num_of_seats", comment: ""), carViewModel.regularSeat)
        regularSeatLabel.sizeToFit()
        
        prioritySeatLabel.text = String(format: NSLocalizedString("num_of_seats", comment: ""), carViewModel.prioritySeat)
        prioritySeatLabel.sizeToFit()
        
        bicycleAreaLabel.text = String(format: NSLocalizedString("num_of_seats", comment: ""), carViewModel.bicycleArea)
        bicycleAreaLabel.sizeToFit()
        
        if let stackView {
            stackView.removeFromSuperview()
            for view in stackView.arrangedSubviews {
                view.removeFromSuperview()
            }
        }
        setupStackView()
        
    }
    
    private func setupStackView() {
        guard let stackView else { return }
        contentView.addSubview(stackView)
        
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.spacing = 7.72
        stackView.distribution = .fillEqually
        stackView.frame = contentView.bounds
        
        stackView.addArrangedSubview(createSeatView(for: "regular-seat"))
        stackView.addArrangedSubview(createSeatView(for: "priority-seat"))
        stackView.addArrangedSubview(createSeatView(for: "bicycle-area"))
    }
    
    private func createSeatView(for name: String) -> UIView {
        let view = UIView()
        view.backgroundColor = .lightBlue
        view.layer.cornerRadius = 9.65
        view.layer.masksToBounds = true
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.frame.size = CGSize(width: 50.19, height: 50.19)
        imageView.contentMode = .scaleAspectFill
        
        let label = UILabel()
        label.text = name.replacing("-", with: " ").capitalized
        label.textColor = .darkBlue
        label.font = .poppinsSemiBold(size: 11.58)
        label.sizeToFit()
        
        
        view.frame.size = CGSize(width: 113.88, height: 115)
        
        view.addSubview(label)
        view.addSubview(imageView)
        label.frame = CGRect(x: view.width / 2 - label.width / 2, y: 7.72, width: label.width, height: label.height)
        imageView.frame = CGRect(x: view.width / 2 - imageView.width / 2, y: label.bottom + 4, width: imageView.width, height: imageView.height)
        
        if name == "regular-seat" {
            view.addSubview(regularSeatLabel)
            regularSeatLabel.frame = CGRect(x: view.width / 2 - regularSeatLabel.width / 2, y: imageView.bottom + 5, width: regularSeatLabel.width, height: regularSeatLabel.height)
        } else if name == "priority-seat" {
            view.addSubview(prioritySeatLabel)
            prioritySeatLabel.frame = CGRect(x: view.width / 2 - prioritySeatLabel.width / 2, y: imageView.bottom + 5, width: prioritySeatLabel.width, height: prioritySeatLabel.height)
        } else {
            view.addSubview(bicycleAreaLabel)
            bicycleAreaLabel.frame = CGRect(x: view.width / 2 - bicycleAreaLabel.width / 2, y: imageView.bottom + 5, width: bicycleAreaLabel.width, height: bicycleAreaLabel.height)
        }
        
        return view
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        stackView?.removeFromSuperview()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
