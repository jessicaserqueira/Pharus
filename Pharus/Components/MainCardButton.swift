//
//  MainCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class MainCardButton: UIButton {
    
    //MARK: - Properties
    
    private var title: String
    private var buttonState: State {
        didSet {
            setBackgroundColor()
        }
    }
    
    //MARK: - Initializer
    
    convenience init(title: String, buttonState: State) {
        self.init()
        
        self.title = title
        self.buttonState = buttonState
        
        configureSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.title = "Fechar"
        self.buttonState = .normal
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    private func configureSubviews() {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.mediumButtonSemiBold
        setBackgroundColor()
        setTitleColor(UIColor.project.grayDisabledText, for: .disabled)
        setTitleColor(UIColor.button.whiteMainButtonText, for: .normal)
        layer.cornerRadius = 16
    }
    
    private func setBackgroundColor() {
        if buttonState == .normal {
            backgroundColor = UIColor.purple.pharusPurple
        } else {
            backgroundColor = UIColor.button.grayDisabledBackground
        }
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    //MARK: - Actions
    
    func disable() {
        self.isEnabled = false
        self.buttonState = .disabled
    }
    
    func enable() {
        self.isEnabled = true
        self.buttonState = .normal
    }
}
