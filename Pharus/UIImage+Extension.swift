//
//  UIImage+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//
import UIKit

extension UIImage {
    
    static let defaultImage = UIImage()
    
    struct icons {
        static let uploadIcon = UIImage(named: K.Assets.Images.uploadImage)
        static let bookIcon = UIImage(named: K.Assets.Icons.bookIcon)
        static let xmarkIcon = UIImage(systemName: K.Assets.Icons.xmarkIcon)
        static let checkmarkIcon = UIImage(named: K.Assets.Icons.checkboxCheckmarkButtonIcon)
        static let backButtonIcon = UIImage(named: K.Assets.Icons.backButtonIcon)
        static let expandIcon = UIImage(named: K.Assets.Icons.expandIcon)
    }
    
    struct images {
        static let avatarImage = UIImage(named: K.Assets.Images.avatarImage)
        static let checkImage = UIImage(named: K.Assets.Images.checkImage)
        static let appLogoImage = UIImage(named: K.Assets.Images.appLogoImage)
        static let companyLogoImage = UIImage(named: K.Assets.Images.companyLogoImage)
        static let userImage = UIImage(named: K.Assets.Images.userImage)
    }
}
