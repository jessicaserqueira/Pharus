//
//  MainCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//
import UIKit

class MainCardButton: UIButton {
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        self.backgroundColor = UIColor(red: 0.765, green: 0.765, blue: 0.765, alpha: 1)
        self.layer.cornerRadius = 16
        self.setTitleColor(.black, for: .normal)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
}
