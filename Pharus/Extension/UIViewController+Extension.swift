//
//  UIViewController+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 19/04/22.
//

import UIKit

extension UIViewController {
    //MARK: - Gradient
    
    func setGradientBackground() {
        let colors = [
            UIColor(red: 0.867, green: 0.149, blue: 0.208, alpha: 1).cgColor,
            UIColor(red: 0.42, green: 0.247, blue: 0.682, alpha: 1).cgColor,
            UIColor(red: 0.918, green: 0.525, blue: 0.259, alpha: 1).cgColor
        ]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.1)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 1.4)
        
        gradientLayer.bounds = view.bounds.insetBy(dx: -0.6 * view.bounds.size.width,
                                                   dy: -0.5 * view.bounds.size.height)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
