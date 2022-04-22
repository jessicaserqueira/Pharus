//
//  Constants.swift
//  Pharus
//
//  Created by Victor Colen on 28/03/22.
//
import Foundation

struct K {
    
    //MARK: - RegEx
    
    struct RegEx {
        static let emailRegEx =  "^[a-z0-9_%+-]+([.-][a-z0-9]+)*@[a-z0-9]+([.-][a-z0-9]+)*\\.[a-z]{2,3}$"
        static let passwordRegEx = "^(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    }
    
    //MARK: - Cell Resuse Identifiers
    
    struct CellReuseIdentifiers {
        static let userProjects = "userProjects"
        static let userRankingProjects = "userRankingProjects"
        static let avatarSelection = "avatarSelection"
    }
    
    //MARK: - Assets
    
    struct Assets {
        
        //MARK: - Icons
        
        struct Icons {
            static let backArrowIcon = "backArrowIcon"
            static let logoutIcon = "logoutIcon"
            static let bookIcon = "bookIcon"
            static let clockIcon = "clockIcon"
            static let rulesIcon = "rulesIcon"
            static let feedbackIcon = "feedbackIcon"
            static let xmarkIcon = "xmarkIcon"
            static let checkboxCheckmarkButtonIcon = "checkboxCheckmarkIcon"
            static let expandIcon = "ExpandIcon"
            static let envelopeIcon = "envelopeIcon"
            static let notificationEnvelopeIcon = "notificationEnvelopeIcon"
            static let uploadIcon = "uploadIcon"
            static let checkIcon = "checkIcon"
            static let rightArrowIcon = "rightArrowIcon"
            static let warningIcon = "warningIcon"
            static let medalIcon =  "medalIcon"
            static let companyIcon = "companyIcon"
            
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
        
        //MARK: - Images
        
        struct Images {
            
            struct Avatar {
                
                struct FullImage {
                    static let avatar1 = "avatar1FullImage"
                    static let avatar2 = "avatar2FullImage"
                    static let avatar3 = "avatar3FullImage"
                    static let avatar4 = "avatar4FullImage"
                    static let avatar5 = "avatar5FullImage"
                    static let avatar6 = "avatar6FullImage"
                    static let avatar7 = "avatar7FullImage"
                    static let avatar8 = "avatar8FullImage"
                    static let avatar9 = "avatar9FullImage"
                    static let avatar10 = "avatar10FullImage"
                    static let avatar11 = "avatar11FullImage"
                    static let avatar12 = "avatar12FullImage"
                    static let avatar13 = "avatar13FullImage"
                    static let avatar14 = "avatar14FullImage"
                    static let avatar15 = "avatar15FullImage"
                    static let avatar16 = "avatar16FullImage"
                    static let avatar17 = "avatar17FullImage"
                    static let avatar18 = "avatar18FullImage"
                    static let avatar19 = "avatar19FullImage"
                    static let avatar20 = "avatar20FullImage"
                    static let suffix = "FullImage"
                }
                
                struct CircleImage {
                    static let avatar1 = "avatar1CircleImage"
                    static let avatar2 = "avatar2CircleImage"
                    static let avatar3 = "avatar3CircleImage"
                    static let avatar4 = "avatar4CircleImage"
                    static let avatar5 = "avatar5CircleImage"
                    static let avatar6 = "avatar6CircleImage"
                    static let avatar7 = "avatar7CircleImage"
                    static let avatar8 = "avatar8CircleImage"
                    static let avatar9 = "avatar9CircleImage"
                    static let avatar10 = "avatar10CircleImage"
                    static let avatar11 = "avatar11CircleImage"
                    static let avatar12 = "avatar12CircleImage"
                    static let avatar13 = "avatar13CircleImage"
                    static let avatar14 = "avatar14CircleImage"
                    static let avatar15 = "avatar15CircleImage"
                    static let avatar16 = "avatar16CircleImage"
                    static let avatar17 = "avatar17CircleImage"
                    static let avatar18 = "avatar18CircleImage"
                    static let avatar19 = "avatar19CircleImage"
                    static let avatar20 = "avatar20CircleImage"
                    static let suffix = "CircleImage"
                }
            }
            static let companyLogoImage = "companyLogoImage"
            static let appLogoImage = "PharusImage"
            
            static let firstPlaceImage = "1stPlaceImage"
            static let secondPlaceImage = "2ndPlaceImage"
            static let thirdPlaceImage = "3rdPlaceImage"
            static let fourthPlaceImage = "4thPlaceImage"
            static let fifthPlaceImage = "5thPlaceImage"
            
            static let firstPlaceMedalImage = "1stPlaceMedalImage"
            static let secondPlaceMedalImage = "2ndPlaceMedalImage"
            static let thirdPlaceMedalImage = "3rdPlaceMedalImage"
            static let fourthPlaceMedalImage = "4thPlaceMedalImage"
            static let fifthPlaceMedalImage = "5thPlaceMedalImage"
        }
    }
    
    //MARK: - Date Formats
    
    struct DateFormats {
        static let projectDateFormat = "dd/MM/yyyy"
    }
}
