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
        static let bookIcon = UIImage(named: K.Assets.Icons.bookIcon)
        static let clockIcon = UIImage(named: K.Assets.Icons.clockIcon)
        static let rulesIcon = UIImage(named: K.Assets.Icons.rulesIcon)
        static let feedbackIcon = UIImage(named: K.Assets.Icons.feedbackIcon)
        static let xmarkIcon = UIImage(systemName: K.Assets.Icons.xmarkIcon)
        static let checkmarkIcon = UIImage(named: K.Assets.Icons.checkboxCheckmarkButtonIcon)
        static let expandIcon = UIImage(named: K.Assets.Icons.expandIcon)
        static let backButtonIcon = UIImage(named: K.Assets.Icons.backButtonIcon)
        
        static let avatarTabBarIcon = UIImage(named: K.Assets.Icons.avatarTabBarIcon)
        static let homeTabBarIcon = UIImage(named: K.Assets.Icons.homeTabBarIcon)
        static let profileTabBarIcon = UIImage(named: K.Assets.Icons.profileTabBarIcon)
        static let projecsTabBarIcon = UIImage(named: K.Assets.Icons.projectsTabBarIcon)
        static let rankingTabBarIcon = UIImage(named: K.Assets.Icons.rankingTabBarIcon)
    }
    
    struct images {
        static let checkImage = UIImage(named: K.Assets.Images.checkImage)
        static let medalImage = UIImage(named: K.Assets.Images.medalImage)
        static let companyLogoImage = UIImage(named: K.Assets.Images.companyLogoImage)
        static let userImage = UIImage(named: K.Assets.Images.userImage)
        static let thirdPlaceImage = UIImage(named: K.Assets.Images.thirdPlaceImage)
        static let uploadImage = UIImage(named: K.Assets.Images.uploadImage)
        static let appLogoImage = UIImage(named: K.Assets.Images.appLogoImage)
        static let avatarImage = UIImage(named: K.Assets.Images.avatarImage)
    }
}
