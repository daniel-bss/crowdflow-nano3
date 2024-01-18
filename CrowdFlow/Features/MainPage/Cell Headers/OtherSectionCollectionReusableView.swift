//
//  OtherSectionCollectionReusableView.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 18/01/24.
//

import UIKit

class OtherSectionCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "OtherSectionCollectionReusableView"
    
    let sectionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    public func configure(text: String) {
        sectionLabel.text = text
        
        setupSectionLabel()
    }
    
    private func setupSectionLabel() {
        addSubview(sectionLabel)
        
        sectionLabel.font = .poppinsSemiBold(size: 22)
        sectionLabel.textColor = .textBlack
        sectionLabel.sizeToFit()
        
        sectionLabel.frame = CGRect(x: 17, y: 0, width: sectionLabel.width, height: sectionLabel.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        sectionLabel.text = nil
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
