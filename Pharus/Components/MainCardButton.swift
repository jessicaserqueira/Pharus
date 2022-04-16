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
    
    private func configureSubviews() {
        setTitle(title, for: .normal)
        backgroundColor = UIColor.button.purpleMainButtonBackground
        setTitleColor(UIColor.button.whiteMainButtonText, for: .normal)
        layer.cornerRadius = 16
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
}
