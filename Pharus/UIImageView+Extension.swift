//
//  UIImageView+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 30/03/22.
//

import UIKit

extension UIImageView {
    func setRounded() {
        let radius = self.frame.width
        self.layer.cornerRadius = 0.5 * radius
        self.layer.masksToBounds = true
    }
}
