//
//  UIFont+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit


//MARK: - Constants

extension UIFont {
    
    static let largeTitleBold = customFont(font: .montserrat, ofSize: .extraLarge, weight: .bold)
    static let mediumTitleBold = customFont(font: .montserrat, ofSize: .medium, weight: .bold)
    static let mediumTitleSemiBold = customFont(font: .montserrat, ofSize: .medium, weight: .semibold)
    
    static let largeButton = customFont(font: .montserrat, ofSize: .large, weight: .medium)
    static let smallButton = customFont(font: .montserrat, ofSize: .small, weight: .semibold)
    
    static let smallBody = customFont(font: .openSans, ofSize: .small)
    static let miniBody = customFont(font: .openSans, ofSize: .mini)
    static let mediumBodyBold = customFont(font: .openSans, ofSize: .medium, weight: .bold)
    
    static func customFont(
        font: FontName,
        ofSize size: FontSize,
        weight: FontWeight = .regular
    ) -> UIFont {
        return UIFont(
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

