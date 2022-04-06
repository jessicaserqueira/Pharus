//
//  UserProfileButton.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class UserProfileButton: UIButton {
    
    var image: UIImage = .checkmarkImage ?? UIImage() {
        didSet {
            configureSubviews()
        }
    }
    
    //MARK: - Views
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
            self.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            self.layer.cornerRadius = 0.5 * self.bounds.size.width
            self.clipsToBounds = true
            self.setImage(image, for: .normal)
    }
}
