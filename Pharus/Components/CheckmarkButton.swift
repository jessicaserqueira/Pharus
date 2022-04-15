//
//  CheckmarkButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class CheckmarkButton: UIButton {
    
    //MARK: - Properties
    
    private var checkImage: UIImage
    
    //MARK: - Initializer
    
    convenience init(checkImage: UIImage) {
        self.init()
        
        self.checkImage = checkImage
        
        setupButton()
    }
    
    override init(frame: CGRect) {
        checkImage = .checkmarkImage!
        
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4
        self.setImage(checkImage, for: .normal)
    }
}
