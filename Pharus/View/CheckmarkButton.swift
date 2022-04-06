//
//  CheckmarkButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import Foundation

import UIKit

class CheckmarkButton: UIButton {
    
    //MARK: - Views
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4
        self.setImage(.checkmarkImage, for: .normal)
    }
        
}
