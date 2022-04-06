//
//  MainCardButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class MainCardButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        self.layer.cornerRadius = 16
        self.backgroundColor = .mainCardButtonBackgroundColor
        self.setTitleColor(.mainCardButtonTextColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
        
}
