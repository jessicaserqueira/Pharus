//
//  UIFont+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit


//MARK: - Constants

extension UIFont {
    
    static let cardTitleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let cardSubtitleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    
    static func customFont(
        font: FontName,
        ofSize size: FontSize,
        weight: FontWeight = .regular
    ) -> UIFont {
        UIFont(
            name: "\(font.rawValue)-\(weight.rawValue)",
            size: size.rawValue
        ) ?? .systemFont(ofSize: size.rawValue)
    }
}

//MARK: - Enums

extension UIFont {
    enum FontSize: CGFloat {
        case mini = 12
        case small = 14
        case medium = 18
        case large = 20
        case extraLarge = 24
        case giant = 32
    }
    
    enum FontName: String {
        case montserrat = "Montserrat"
        case openSans = "OpenSans"
    }
    
    enum FontWeight: String {
        case regular = "Regular"
        case medium = "Medium"
        case semibold = "Semibold"
        case bold = "Bold"
    }
}

