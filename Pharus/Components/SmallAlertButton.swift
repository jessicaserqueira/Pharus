//
//  SmallAlertButton.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class SmallAlertButton: UIButton {
    
    //MARK: - Properties
    
    private var title: String
    private var importance: Importance
    
    enum Importance {
        case primary
        case secondary
    }
        
    //MARK: - Initializer
    
    convenience init(
        title: String,
        importance: Importance
    ) {
        self.init()
        
        self.title = title
        self.importance = importance
        
        configureSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.title = "Sair"
        self.importance = .primary
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    func configureSubviews() {
        setTitle(title, for: .normal)
        layer.borderWidth = 2
        layer.borderColor = UIColor.purple.pharusPurple.cgColor
        layer.cornerRadius = 16
        
        if importance == .primary {
            backgroundColor = UIColor.purple.pharusPurple
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = .clear
            setTitleColor(UIColor.purple.pharusPurple, for: .normal)
        }
    }
        
    //MARK: - Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}

