//
//  CheckmarkButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class CheckmarkButton: UIButton {
        
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    private func setupButton() {
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 4
        self.setImage(UIImage.icons.checkmarkIcon , for: .normal)
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 25),
            self.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
}
