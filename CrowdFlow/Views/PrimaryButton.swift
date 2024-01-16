//
//  PrimaryButton.swift
//  CrowdFlow
//
//  Created by Daniel Bernard Sahala Simamora on 17/01/24.
//

import UIKit

protocol PrimaryButtonDelegate {
    func buttonTapped()
}

class PrimaryButton: UIButton {
    
    var delegate: PrimaryButtonDelegate?
    let label = UILabel()
    
    init(text: String) {
        super.init(frame: .zero)
        
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        backgroundColor = .darkBlue
        layer.cornerRadius = 12
        
        super.setupShadow()
        
        label.text = text
        
        frame.size = CGSize(width: 358, height: 53)
        setupLabel()
    }
    
    private func setupLabel() {
        addSubview(label)
        
        label.font = .poppinsSemiBold(size: 20)
        label.textColor = .white
        label.sizeToFit()
        
        label.frame = CGRect(x: self.width / 2 - label.width / 2, y: self.height / 2 - label.height / 2, width: label.width, height: label.height)
    }
    
    @objc private func didTapButton() {
        delegate?.buttonTapped()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
