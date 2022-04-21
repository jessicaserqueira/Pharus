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
        static let xmarkIcon = UIImage(named: K.Assets.Icons.xmarkIcon)
        static let checkmarkIcon = UIImage(named: K.Assets.Icons.checkboxCheckmarkButtonIcon)
        static let expandIcon = UIImage(named: K.Assets.Icons.expandIcon)
        static let backArrowIcon = UIImage(named: K.Assets.Icons.backArrowIcon)
        static let envelopeIcon = UIImage(named: K.Assets.Icons.envelopeIcon)
        static let notificationEnvelopeIcon = UIImage(named: K.Assets.Icons.notificationEnvelopeIcon)
        static let uploadIcon = UIImage(named: K.Assets.Icons.uploadIcon)
        static let checkIcon = UIImage(named: K.Assets.Icons.checkIcon)
        static let logOutIcon = UIImage(named: K.Assets.Icons.logoutIcon)
        static let rightArrowIcon = UIImage(named: K.Assets.Icons.rightArrowIcon)
        
        static let avatarTabBarIcon = UIImage(named: K.Assets.Icons.avatarTabBarIcon)
        static let homeTabBarIcon = UIImage(named: K.Assets.Icons.homeTabBarIcon)
        static let profileTabBarIcon = UIImage(named: K.Assets.Icons.profileTabBarIcon)
        static let projecsTabBarIcon = UIImage(named: K.Assets.Icons.projectsTabBarIcon)
        static let rankingTabBarIcon = UIImage(named: K.Assets.Icons.rankingTabBarIcon)
        
        static let avatarTabBarIconSelected = UIImage(named: K.Assets.Icons.avatarTabBarIconSelected)
        static let homeTabBarIconSelected = UIImage(named: K.Assets.Icons.homeTabBarIconSelected)
        static let profileTabBarIconSelected = UIImage(named: K.Assets.Icons.profileTabBarIconSelected)
        static let projecsTabBarIconSelected = UIImage(named: K.Assets.Icons.projectsTabBarIconSelected)
        static let rankingTabBarIconSelected = UIImage(named: K.Assets.Icons.rankingTabBarIconSelected)
    }
    
    struct images {
        static let companyLogoImage = UIImage(named: K.Assets.Images.companyLogoImage)
        static let appLogoImage = UIImage(named: K.Assets.Images.appLogoImage)
        
        struct avatars {
            
            static let avatarsDict: [UIImage : UIImage] = [
                (.images.avatars.circleImage.avatar1 ?? .defaultImage) : .images.avatars.fullImage.avatar1 ?? .defaultImage
            ]
            
            struct fullImage {
                static let avatar1 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar1)
                static let avatar2 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar2)
                static let avatar3 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar3)
                static let avatar4 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar4)
                static let avatar5 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar5)
                static let avatar6 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar6)
                static let avatar7 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar7)
                static let avatar8 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar8)
                static let avatar9 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar9)
                static let avatar10 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar10)
                static let avatar11 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar11)
                static let avatar12 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar12)
                static let avatar13 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar13)
                static let avatar14 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar14)
                static let avatar15 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar15)
                static let avatar16 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar16)
                static let avatar17 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar17)
                static let avatar18 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar18)
                static let avatar19 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar19)
                static let avatar20 = UIImage(named: K.Assets.Images.Avatar.FullImage.avatar20)
                
                static let avatars = [
                    avatar1,
                    avatar2,
                    avatar3,
                    avatar4,
                    avatar5,
                    avatar6,
                    avatar7,
                    avatar8,
                    avatar9,
                    avatar10,
                    avatar11,
                    avatar12,
                    avatar13,
                    avatar14,
                    avatar15,
                    avatar16,
                    avatar17,
                    avatar18,
                    avatar19,
                    avatar20
                ]
            }
            
            struct circleImage {
                static let avatar1 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar1)
                static let avatar2 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar2)
                static let avatar3 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar3)
                static let avatar4 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar4)
                static let avatar5 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar5)
                static let avatar6 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar6)
                static let avatar7 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar7)
                static let avatar8 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar8)
                static let avatar9 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar9)
                static let avatar10 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar10)
                static let avatar11 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar11)
                static let avatar12 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar12)
                static let avatar13 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar13)
                static let avatar14 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar14)
                static let avatar15 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar15)
                static let avatar16 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar16)
                static let avatar17 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar17)
                static let avatar18 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar18)
                static let avatar19 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar19)
                static let avatar20 = UIImage(named: K.Assets.Images.Avatar.CircleImage.avatar20)
                
                static let avatars = [
                    avatar1,
                    avatar2,
                    avatar3,
                    avatar4,
                    avatar5,
                    avatar6,
                    avatar7,
                    avatar8,
                    avatar9,
                    avatar10,
                    avatar11,
                    avatar12,
                    avatar13,
                    avatar14,
                    avatar15,
                    avatar16,
                    avatar17,
                    avatar18,
                    avatar19,
                    avatar20
                ]
            }
            
        }
        static let firstPlaceImage = UIImage(named: K.Assets.Images.firstPlaceImage)
        static let secondPlaceImage = UIImage(named: K.Assets.Images.secondPlaceImage)
        static let thirdPlaceImage = UIImage(named: K.Assets.Images.thirdPlaceImage)
        static let fourthPlaceImage = UIImage(named: K.Assets.Images.fourthPlaceImage)
        static let fifthPlaceImage = UIImage(named: K.Assets.Images.fifthPlaceImage)
        
        static let firstPlaceMedalImage = UIImage(named: K.Assets.Images.firstPlaceMedalImage)
        static let secondPlaceMedalImage = UIImage(named: K.Assets.Images.secondPlaceMedalImage)
        static let thirdPlaceMedalImage = UIImage(named: K.Assets.Images.thirdPlaceMedalImage)
        static let fourthPlaceMedalImage = UIImage(named: K.Assets.Images.fourthPlaceMedalImage)
        static let fifthPlaceMedalImage = UIImage(named: K.Assets.Images.fifthPlaceMedalImage)
    }
}
