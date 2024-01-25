//
//  TrainDetailsCollectionViewCell.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 20/01/24.
//

import UIKit

class TrainDetailsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TrainDetailsCollectionViewCell"
    
    let destinationLabel = UILabel()
    
    let startFromLabel = UILabel()
    let startingTrainLabel = UILabel()
    let startTimeLabel = UILabel()
    
    let arrivingAtLabel = UILabel()
    let arrivingTrainLabel = UILabel()
    let arrivingTimeLabel = UILabel()
    
    let carriageView = LargeCarriageIconView()
    let otherLabel = UILabel()
    
    var carImageViews = [UIImageView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightBlue
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    public func configure(id: Int, viewModel: TrainInformationViewModel) {
        destinationLabel.text = "To \(viewModel.finalDestination)"
        startingTrainLabel.text = viewModel.startFrom
        arrivingTrainLabel.text = viewModel.arrivingAt
        
        startTimeLabel.text = Utils.getFormattedTimeString(date: AppManager.shared.dateNow)
        arrivingTimeLabel.text = Utils.getFormattedTimeString(date: AppManager.shared.dateNow.addingTimeInterval(20 * 60))
        
        setupCarsView(id: id, viewModel: viewModel)
        
        setupDestinationLabel()
        
        setupStartingLabels()
        setupArrivingLabels()
        
        setupCarriageView()
        
        setupStackView()
    }
    
    private func setupCarsView(id: Int, viewModel: TrainInformationViewModel) {
        let containerView = UIView()
        let lineView = UIView()
        
        contentView.addSubview(lineView)
        contentView.addSubview(containerView)
        
        lineView.backgroundColor = .darkBlue
        
        if carImageViews.count > 0 {
            carImageViews.removeAll()
        }
        
        var carColors = [String]()
        if id == 0 {
            for i in 0..<6 {
                let car: CarCell = viewModel.carCells[5 - i]
                let carTotalSeats: Int = car.regularSeat + car.prioritySeat + car.bicycleArea
                
                if carTotalSeats <= 23 {
                    carColors.append("red")
                } else if (carTotalSeats > 23) && (carTotalSeats <= 47) {
                    carColors.append("yellow")
                } else {
                    carColors.append("green")
                }
            }
        } else {
            for car in viewModel.carCells {
                let carTotalSeats: Int = car.regularSeat + car.prioritySeat + car.bicycleArea
                
                if carTotalSeats <= 23 {
                    carColors.append("red")
                } else if (carTotalSeats > 23) && (carTotalSeats <= 47) {
                    carColors.append("yellow")
                } else {
                    carColors.append("green")
                }
            }
        }
        
        let arrowImageView = UIImageView()
        containerView.addSubview(arrowImageView)
        if id == 0 {
            containerView.frame = CGRect(x: 25, y: 59, width: 285, height: 28.22)
            for i in 0..<6 {
                carImageViews.append(UIImageView())
                
                if i == 0 {
                    carImageViews[i].image = UIImage(named: "\(carColors[i])-car-left-tail")
                    carImageViews[i].frame = CGRect(x: 0, y: 0, width: 46, height: 37)
                } else if i == 5 {
                    carImageViews[i].image = UIImage(named: "\(carColors[i])-car-right-head")
                    
                    let xOffset: CGFloat = 43.02 + (Double(i) * 3.39) + ((Double(i) - 1) * 42.89)
                    carImageViews[i].frame = CGRect(
                        x: xOffset - 0,
                        y: 0,
                        width: 56,
                        height: 37
                    )
                } else {
                    carImageViews[i].image = UIImage(named: "\(carColors[i])-car")
                    
                    let xOffset: CGFloat = 43.02 + (Double(i) * 4) + ((Double(i) - 1) * 42.89)
                    carImageViews[i].frame = CGRect(
                        x: xOffset,
                        y: 0,
                        width: 42.89,
                        height: 28.22
                    )
                }
            }
            
            for carImageView in carImageViews {
                containerView.addSubview(carImageView)
            }
            
            arrowImageView.image = UIImage(named: "car-right-arrow")
            arrowImageView.frame = CGRect(x: containerView.width - 3, y: containerView.height + 6, width: 28.78, height: 7.9)
        } else {
            containerView.frame = CGRect(x: 43.43, y: 59, width: 285, height: 28.22)
            for i in 0..<6 {
                carImageViews.append(UIImageView())
                
                if i == 0 {
                    carImageViews[i].image = UIImage(named: "\(carColors[i])-car-left-head")
                    carImageViews[i].frame = CGRect(x: 0, y: 0, width: 50, height: 28.22)
                } else if i == 5 {
                    carImageViews[i].image = UIImage(named: "\(carColors[i])-car-right-tail")
                    
                    let xOffset: CGFloat = 50 + (Double(i) * 3.39) + ((Double(i) - 1) * 42.89)
                    carImageViews[i].frame = CGRect(
                        x: xOffset + 4,
                        y: 0,
                        width: 41,
                        height: 28.22
                    )
                } else {
                    carImageViews[i].image = UIImage(named: "\(carColors[i])-car")
                    
                    let xOffset: CGFloat = 50 + (Double(i) * 4) + ((Double(i) - 1) * 42.89)
                    carImageViews[i].frame = CGRect(
                        x: xOffset,
                        y: 0,
                        width: 42.89,
                        height: 28.22
                    )
                }
            }
            
            for carImageView in carImageViews {
                containerView.addSubview(carImageView)
            }
            
            arrowImageView.image = UIImage(named: "car-left-arrow")
            arrowImageView.frame = CGRect(x: -28.78 + 3, y: containerView.height + 6, width: 28.78, height: 7.9)
        }
        
        lineView.frame = CGRect(x: containerView.frame.minX + 15, y: containerView.top + 14, width: containerView.width - (15 * 2), height: 5.75)
        
        for i in 0..<6 {
            let numberLabel = UILabel()
            numberLabel.text = id == 0 ? "\(5 - i + 1)" : "\(i + 1)"
            numberLabel.font = .poppinsBold(size: 14)
            numberLabel.textColor = .darkBlue
            numberLabel.sizeToFit()
            
            let xOffset: CGFloat = carImageViews[i].frame.midX
            
            numberLabel.frame = CGRect(
                x: xOffset - 4,
                y: 32,
                width: numberLabel.width,
                height: numberLabel.height
            )
            containerView.addSubview(numberLabel)
        }
    }
    
    private func setupDestinationLabel() {
        contentView.addSubview(destinationLabel)
        
        destinationLabel.font = .poppinsSemiBold(size: 17)
        destinationLabel.textColor = .textBlack
        destinationLabel.sizeToFit()
        
        destinationLabel.frame = CGRect(x: 14, y: 13, width: destinationLabel.width, height: destinationLabel.height)
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
        
        startFromLabel.frame = CGRect(x: 9, y: contentView.height - startFromLabel.width - 20, width: startFromLabel.width, height: startFromLabel.height)
        startingTrainLabel.frame = CGRect(x: 9, y: startFromLabel.bottom + 3, width: startingTrainLabel.width, height: startingTrainLabel.height)
        startTimeLabel.frame = CGRect(x: 9, y: startingTrainLabel.bottom + 3, width: startTimeLabel.width, height: startTimeLabel.height)
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
        
        arrivingAtLabel.frame = CGRect(x: contentView.width - arrivingAtLabel.width - 9, y: startFromLabel.frame.minY, width: arrivingAtLabel.width, height: arrivingAtLabel.height)
        arrivingTrainLabel.frame = CGRect(x: contentView.width - arrivingTrainLabel.width - 9, y: startFromLabel.bottom + 3, width: arrivingTrainLabel.width, height: arrivingTrainLabel.height)
        arrivingTimeLabel.frame = CGRect(x: contentView.width - arrivingTimeLabel.width - 9, y: startingTrainLabel.bottom + 3, width: arrivingTimeLabel.width, height: arrivingTimeLabel.height)
    }
    
    private func setupCarriageView() {
        contentView.addSubview(carriageView)
        contentView.addSubview(otherLabel)
        
        let totalWidth: CGFloat = 74.4
        let totalHeight: CGFloat = 19.05
        
        carriageView.frame = CGRect(
            x: contentView.width / 2 - totalWidth / 2,
            y: startFromLabel.top + 3,
            width: totalWidth,
            height: totalHeight
        )
        
        otherLabel.text = "MRT stops every 5 minutes"
        otherLabel.numberOfLines = 2
        otherLabel.textAlignment = .center
        otherLabel.font = .poppinsMedium(size: 10)
        otherLabel.textColor = .black
        otherLabel.frame.size = CGSize(width: 81, height: 37)
        otherLabel.frame = CGRect(x: contentView.width / 2 - otherLabel.width / 2, y: carriageView.bottom + 2.51, width: otherLabel.width, height: otherLabel.height)
    }
    
    private func setupStackView() {
        let vacantView = createStatusView(for: "vacant")
        let busyView = createStatusView(for: "busy")
        let fullView = createStatusView(for: "full")
        
        contentView.addSubview(vacantView)
        contentView.addSubview(busyView)
        contentView.addSubview(fullView)
        
        busyView.frame = CGRect(x: 10 + contentView.width / 2 - busyView.width / 2, y: contentView.height / 2 - busyView.height / 2 + 10, width: busyView.width, height: busyView.height)
        vacantView.frame = CGRect(x: busyView.frame.minX - vacantView.width - 12, y: busyView.frame.minY, width: vacantView.width, height: vacantView.height)
        fullView.frame = CGRect(x: busyView.frame.maxX + 12, y: busyView.frame.minY, width: fullView.width, height: fullView.height)
    }
    
    private func createStatusView(for name: String) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: name + "-icon"))
        imageView.frame.size = CGSize(width: 16, height: 16)
        
        let label = UILabel()
        label.text = name.capitalized
        label.font = .poppinsMedium(size: 14.43)
        label.textColor = .textBlack
        label.sizeToFit()
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        view.frame = CGRect(x: 0, y: 0, width: imageView.width + 12 + label.width, height: view.height)
        imageView.frame = CGRect(x: 0, y: view.height / 2 - imageView.height / 2, width: imageView.width, height: imageView.height)
        label.frame = CGRect(x: imageView.right + 12, y: view.height / 2 - label.height / 2, width: label.width, height: label.height)
        
        return view
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        destinationLabel.text = nil
        startFromLabel.text = nil
        startingTrainLabel.text = nil
        startTimeLabel.text = nil
        arrivingAtLabel.text = nil
        arrivingTrainLabel.text = nil
        arrivingTimeLabel.text = nil
        carriageView.removeFromSuperview()
        otherLabel.text = nil
        
        for imageView in carImageViews {
            imageView.image = nil
        }
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
