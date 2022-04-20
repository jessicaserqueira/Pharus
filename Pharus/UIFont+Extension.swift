//
//  UIFont+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//
import UIKit


//MARK: - Constants
extension UIFont {
    
    static let largeTitleBold = customFont(font: .montserrat, ofSize: .large, weight: .bold)
    static let largeTitleMedium = customFont(font: .montserrat, ofSize: .large, weight: .medium)
    static let mediumTitleMedium = customFont(font: .montserrat, ofSize: .medium, weight: .medium)
    static let mediumTitleBold = customFont(font: .montserrat, ofSize: .medium, weight: .bold)
    static let mediumTitleSemiBold = customFont(font: .montserrat, ofSize: .medium, weight: .semibold)
    static let smallTitleMedium = customFont(font: .montserrat, ofSize: .small, weight: .medium)
    
    static let largeButton = customFont(font: .montserrat, ofSize: .large, weight: .medium)
    static let smallButton = customFont(font: .montserrat, ofSize: .small, weight: .semibold)
    
    static let mediumBody = customFont(font: .openSans, ofSize: .medium)
    static let mediumBodyBold = customFont(font: .openSans, ofSize: .medium, weight: .bold)
    static let smallBody = customFont(font: .openSans, ofSize: .small)
    static let smallBodyBold = customFont(font: .openSans, ofSize: .small, weight: .bold)
    static let miniBody = customFont(font: .openSans, ofSize: .mini)
    
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
