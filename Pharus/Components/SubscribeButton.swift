//
//  SubscribeButton.swift
//  Pharus
//
//  Created by Victor Colen on 17/04/22.
//

import UIKit

class SubscribeButton: UIButton {
    
    //MARK: - Properties
    
    var isSubscribed: Bool {
        didSet {
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           options: .curveLinear) {
                self.changeButtonStatus()
            }
        }
    }
    
    //MARK: - Initializer
    
    convenience init(isSubscribed: Bool) {
        self.init()
        
        self.isSubscribed = isSubscribed
        
        configureSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.isSubscribed = false
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        setTitle(
            isSubscribed ? "Inscrito" : "Inscreva-se",
            for: .normal
        )
        setTitleColor(
            isSubscribed ? UIColor.button.grayDisabledText : UIColor.purple.pharusPurple,
            for: .normal
        )
        
        titleLabel?.font = UIFont.smallButton
        backgroundColor = .clear
        contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        
        layer.borderColor = isSubscribed ? UIColor.button.pinkDisabledBorder.cgColor : UIColor.purple.pharusPurple.cgColor
        
        layer.borderWidth = 2
        layer.cornerRadius = 16
        
    }
    
    private func changeButtonStatus() {
        setTitle(
            isSubscribed ? "Inscrito" : "Inscreva-se",
            for: .normal
        )
        
        setTitleColor(
            isSubscribed ? UIColor.button.grayDisabledText : UIColor.purple.pharusPurple,
            for: .normal
        )
        
        layer.borderColor = isSubscribed ? UIColor.button.pinkDisabledBorder.cgColor : UIColor.purple.pharusPurple.cgColor
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}

