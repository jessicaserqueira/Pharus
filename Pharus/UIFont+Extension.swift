//
//  UIFont+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit

extension UIFont {
    static let cardTitleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let cardSubtitleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    
    static func heeboSemiBold(ofSize size: CGFloat) -> UIFont {
        UIFont(name: "Montserrat-Bold", size: size) ?? .systemFont(ofSize: size)
    }
}
