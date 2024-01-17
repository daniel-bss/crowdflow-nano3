//
//  MainSectionCollectionReusableView.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 18/01/24.
//

import UIKit

class MainSectionCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "MainSectionCollectionReusableView"
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }()
    
    let sectionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
    }
    
    public func configure() {
        setupBgView()
        setupSectionLabel()
    }
    
    public func setupBgView() {
        let icon = UIImageView(image: UIImage(systemName: "location.circle.fill"))
        icon.tintColor = .darkBlue
        icon.frame.size = CGSize(width: 16, height: 16)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Senayan Station, South Jakarta, Indonesia."
        descriptionLabel.font = .poppinsRegular(size: 12)
        descriptionLabel.textColor = .textBlue
        descriptionLabel.sizeToFit()
        
        addSubview(bgView)
        bgView.addSubview(icon)
        bgView.addSubview(descriptionLabel)
        
        bgView.frame = CGRect(x: 0, y: 0, width: width, height: 34)
        icon.frame = CGRect(x: 16, y: bgView.height / 2 - icon.height / 2, width: icon.width, height: icon.height)
        descriptionLabel.frame = CGRect(x: icon.right + 7, y: bgView.height / 2 - descriptionLabel.height / 2, width: descriptionLabel.width, height: descriptionLabel.height)
    }
    
    private func setupSectionLabel() {
        addSubview(sectionLabel)
        
        sectionLabel.text = "On-Going Train Information"
        sectionLabel.font = .poppinsSemiBold(size: 22)
        sectionLabel.textColor = .textBlack
        sectionLabel.sizeToFit()
        
        sectionLabel.frame = CGRect(x: 17, y: bgView.bottom + 20, width: sectionLabel.width, height: sectionLabel.height)
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        bgView.removeFromSuperview()
        sectionLabel.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
