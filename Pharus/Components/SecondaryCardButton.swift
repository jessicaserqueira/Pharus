//
//  SecondaryCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class SecondaryCardButton: UIButton {
    
    //MARK: - Properties
    
    private var title: String
    
    //MARK: - Initializer
    
    convenience init(title: String) {
        self.init()
        
        self.title = title
        
        configureSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.title = "Fechar"
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func disable() {
        self.isEnabled = false
    }
    
    func enable() {
        self.isEnabled = true
    }
    
    private func configureSubviews() {
        setTitle(title, for: .normal)
        setTitleColor(UIColor.purple.pharusPurple, for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 2
        layer.borderColor = UIColor.purple.pharusPurple.cgColor
        layer.cornerRadius = 16
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
}

