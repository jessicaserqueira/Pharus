//
//  CheckmarkButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class CheckmarkButton: UIButton {
    
    //MARK: - Properties
    
    var checkImage: UIImage
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        checkImage = UIImage.icons.checkmarkIcon ?? .defaultImage
        
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4
        self.setImage(checkImage, for: .normal)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 25),
            self.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
}
