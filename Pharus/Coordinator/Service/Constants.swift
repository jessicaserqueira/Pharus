//
//  Constants.swift
//  Pharus
//
//  Created by Victor Colen on 28/03/22.
//
import Foundation

struct K {
    struct RegEx {
        static let emailRegEx =  "^[a-z0-9_%+-]+([.-][a-z0-9]+)*@[a-z0-9]+([.-][a-z0-9]+)*\\.[a-z]{2,3}$"
        static let passwordRegEx = "^(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    }
    
    struct CellReuseIdentifiers {
        static let userProjects = "userProjects"
        static let userRankingProjects = "userRankingProjects"
    }
    
    struct Assets {
        
        struct Icons {
            static let backButtonIcon = "backButtonIcon"
            static let logoutButtonIcon = "logoutButtonIcon"
            static let bookIcon = "bookIcon"
            static let clockIcon = "clockIcon"
            static let rulesIcon = "rulesIcon"
            static let feedbackIcon = "feedbackIcon"
            static let xmarkIcon = "xmark"
            static let checkboxCheckmarkButtonIcon = "checkboxCheckmarkIcon"
            static let expandIcon = "ExpandIcon"
            static let envelopeIcon = "envelopeIcon"
            static let notificationEnvelopeIcon = "notificationEnvelopeIcon"
            static let uploadIcon = "uploadIcon"
            static let checkIcon = "checkIcon"
            
            static let avatarTabBarIcon = "avatarTabBarIcon"
            static let homeTabBarIcon = "homeTabBarIcon"
            static let profileTabBarIcon = "profileTabBarIcon"
            static let projectsTabBarIcon = "projectsTabBarIcon"
            static let rankingTabBarIcon = "rankingTabBarIcon"
            
            static let avatarTabBarIconSelected = "avatarTabBarIconSelected"
            static let homeTabBarIconSelected = "homeTabBarIconSelected"
            static let profileTabBarIconSelected = "profileTabBarIconSelected"
            static let projectsTabBarIconSelected = "projectsTabBarIconSelected"
            static let rankingTabBarIconSelected = "rankingTabBarIconSelected"
        }
        
        struct Images {
            static let checkImage = "checkImage"
            static let rectangleImage = "rectangleImage"
            static let medalImage = "medalImage"
            static let companyLogoImage = "companyLogoImage"
            static let userImage = "userImage"
            static let thirdPlaceImage = "thirdPlaceImage"
            static let appLogoImage = "PharusImage"
            static let avatarImage = "AvatarScreenImage"
        }
    }
    
    struct DateFormats {
        static let projectDateFormat = "dd/MM/yyyy"
    }
}

