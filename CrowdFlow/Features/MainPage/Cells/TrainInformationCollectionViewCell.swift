//
//  TrainInformationCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 18/01/24.
//

import UIKit

class TrainInformationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TrainInformationCollectionViewCell"
    
    let destinationLabel = UILabel()
    let platformLabel = UILabel()
    
    let startFromLabel = UILabel()
    let startingTrainLabel = UILabel()
    let startTimeLabel = UILabel()
    
    let arrivingAtLabel = UILabel()
    let arrivingTrainLabel = UILabel()
    let arrivingTimeLabel = UILabel()
    
    let carriageView = CarriageIconView()
    let otherLabel = UILabel()
    let lowerView = UIView()
    let lastUpdatedLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .lightBlue
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        super.setupShadow2()
    }
    
    public func configure(trainInformation: TrainInformationData) {
        destinationLabel.text = trainInformation.finalDestination
        platformLabel.text = "Platform \(trainInformation.platformNumber)"
        startingTrainLabel.text = trainInformation.startFrom
        arrivingTrainLabel.text = trainInformation.arrivingAt
        
        startTimeLabel.text = Utils.getFormattedTimeString(date: AppManager.shared.dateNow)
        arrivingTimeLabel.text = Utils.getFormattedTimeString(date: AppManager.shared.dateNow.addingTimeInterval(20 * 60))
        
        setupDestinationLabel()
        setupPlatformLabel()
        
        setupStartingLabels()
        setupArrivingLabels()
        
        setupCarriageView()
        setupLowerView()
    }
    
    private func setupDestinationLabel() {
        contentView.addSubview(destinationLabel)
        
        destinationLabel.font = .poppinsSemiBold(size: 17)
        destinationLabel.textColor = .textBlack
        destinationLabel.sizeToFit()
        
        destinationLabel.frame = CGRect(x: 7, y: 15, width: destinationLabel.width, height: destinationLabel.height)
    }
    
    private func setupPlatformLabel() {
        contentView.addSubview(platformLabel)
        
        platformLabel.font = .poppinsRegular(size: 11)
        platformLabel.textColor = .textBlack
        platformLabel.sizeToFit()
        
        platformLabel.frame = CGRect(x: 7, y: destinationLabel.bottom - 3, width: destinationLabel.width, height: destinationLabel.height)
    }
    
    private func setupStartingLabels() {
        contentView.addSubview(startFromLabel)
        contentView.addSubview(startingTrainLabel)
        contentView.addSubview(startTimeLabel)
        
        startFromLabel.text = "Start from"
        startFromLabel.font = .poppinsMedium(size: 10)
        startFromLabel.textColor = .black
        startFromLabel.sizeToFit()
        
        startingTrainLabel.font = .poppinsSemiBold(size: 13)
        startingTrainLabel.textColor = .darkBlue
        startingTrainLabel.sizeToFit()
        
        startTimeLabel.font = .poppinsRegular(size: 11)
        startTimeLabel.textColor = .black
        startTimeLabel.sizeToFit()
        
        startFromLabel.frame = CGRect(x: 7, y: platformLabel.bottom + 14, width: startFromLabel.width, height: startFromLabel.height)
        startingTrainLabel.frame = CGRect(x: 7, y: startFromLabel.bottom + 3, width: startingTrainLabel.width, height: startingTrainLabel.height)
        startTimeLabel.frame = CGRect(x: 7, y: startingTrainLabel.bottom + 3, width: startTimeLabel.width, height: startTimeLabel.height)
    }
    
    private func setupArrivingLabels() {
        contentView.addSubview(arrivingAtLabel)
        contentView.addSubview(arrivingTrainLabel)
        contentView.addSubview(arrivingTimeLabel)
        
        arrivingAtLabel.text = "Now arriving at"
        arrivingAtLabel.font = .poppinsMedium(size: 10)
        arrivingAtLabel.textColor = .black
        arrivingAtLabel.sizeToFit()
        
        arrivingTrainLabel.font = .poppinsSemiBold(size: 13)
        arrivingTrainLabel.textColor = .darkBlue
        arrivingTrainLabel.sizeToFit()
        
        arrivingTimeLabel.font = .poppinsRegular(size: 11)
        arrivingTimeLabel.textColor = .black
        arrivingTimeLabel.sizeToFit()
        
        arrivingAtLabel.frame = CGRect(x: contentView.width - arrivingAtLabel.width - 7, y: platformLabel.bottom + 14, width: arrivingAtLabel.width, height: arrivingAtLabel.height)
        arrivingTrainLabel.frame = CGRect(x: contentView.width - arrivingTrainLabel.width - 7, y: startFromLabel.bottom + 3, width: arrivingTrainLabel.width, height: arrivingTrainLabel.height)
        arrivingTimeLabel.frame = CGRect(x: contentView.width - arrivingTimeLabel.width - 7, y: startingTrainLabel.bottom + 3, width: arrivingTimeLabel.width, height: arrivingTimeLabel.height)
    }
    
    private func setupCarriageView() {
        contentView.addSubview(carriageView)
        contentView.addSubview(otherLabel)
        
        let totalWidth: CGFloat = 59.48
        let totalHeight: CGFloat = 16.4
        
        carriageView.frame = CGRect(
            x: contentView.width / 2 - totalWidth / 2,
            y: 92.43 - (totalHeight / 2),
            width: totalWidth,
            height: totalHeight
        )
        
        otherLabel.text = "MRT stops every 5 minutes"
        otherLabel.font = .poppinsRegular(size: 8.33)
        otherLabel.textColor = .black
        otherLabel.sizeToFit()
        otherLabel.frame = CGRect(x: contentView.width / 2 - otherLabel.width / 2, y: carriageView.bottom + 2.51, width: otherLabel.width, height: otherLabel.height)
    }
    
    private func setupLowerView() {
        lowerView.backgroundColor = .darkBlue3
        Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timerDidChange), userInfo: nil, repeats: true)
        
        lastUpdatedLabel.text = "Last updated at \(Utils.getFormattedTimeString(date: AppManager.shared.lastUpdated))"
        lastUpdatedLabel.font = .poppinsMedium(size: 12)
        lastUpdatedLabel.textColor = .lightBlue
        lastUpdatedLabel.sizeToFit()
        
        let chevronImageView = UIImageView(image: UIImage(systemName: "chevron.right.circle.fill"))
        chevronImageView.tintColor = .lightBlue
        chevronImageView.frame.size = CGSize(width: 18, height: 18)
        
        contentView.addSubview(lowerView)
        lowerView.addSubview(lastUpdatedLabel)
        lowerView.addSubview(chevronImageView)
        
        lowerView.frame = CGRect(x: 0, y: contentView.height - 36, width: contentView.width, height: 36)
        lastUpdatedLabel.frame = CGRect(x: 13, y: lowerView.height / 2 - lastUpdatedLabel.height / 2, width: lastUpdatedLabel.width, height: lastUpdatedLabel.height)
        chevronImageView.frame = CGRect(x: contentView.width - 18 - chevronImageView.width, y: lowerView.height / 2 - chevronImageView.height / 2, width: chevronImageView.width, height: chevronImageView.height)
    }
    
    @objc func timerDidChange() {
        AppManager.shared.lastUpdated = AppManager.shared.lastUpdated.addingTimeInterval(60)
        lastUpdatedLabel.text = "Last updated at \(Utils.getFormattedTimeString(date: AppManager.shared.lastUpdated))"
        
        lastUpdatedLabel.sizeToFit()
        lastUpdatedLabel.frame = CGRect(
            x: lastUpdatedLabel.frame.minX,
            y: lastUpdatedLabel.frame.minY,
            width: lastUpdatedLabel.width,
            height: lastUpdatedLabel.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        destinationLabel.text = nil
        platformLabel.text = nil
        carriageView.removeFromSuperview()
        lowerView.removeFromSuperview()
        
        startFromLabel.text = nil
        startingTrainLabel.text = nil
        startTimeLabel.text = nil
        
        arrivingAtLabel.text = nil
        arrivingTrainLabel.text = nil
        arrivingTimeLabel.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
