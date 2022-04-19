//
//  UIViewController+extension.swift
//  Pharus
//
//  Created by Victor Colen on 19/04/22.
//

import UIKit

extension UIViewController {
    //MARK: - Gradient
    
    func setGradientBackground() {
        let colors = [
            UIColor(red: 0.235, green: 0.125, blue: 0.694, alpha: 1).cgColor,
            UIColor(red: 0.933, green: 0.298, blue: 0.557, alpha: 1).cgColor,
            UIColor(red: 0.918, green: 0.525, blue: 0.259, alpha: 1).cgColor
        ]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.4)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1.2)
        
        gradientLayer.bounds = view.bounds.insetBy(dx: -0.6 * view.bounds.size.width,
                                                   dy: -0.5 * view.bounds.size.height)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
