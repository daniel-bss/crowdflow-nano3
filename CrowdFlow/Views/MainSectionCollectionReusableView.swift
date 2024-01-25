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
        setupSectionLabel()
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
