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
        static let avatarSelection = "avatarSelection"
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
            
            struct Avatar {
                
                struct FullImage {
                    static let avatar1 = "avatar01FullImage"
                    static let avatar2 = "avatar02FullImage"
                    static let avatar3 = "avatar03FullImage"
                    static let avatar4 = "avatar04FullImage"
                    static let avatar5 = "avatar05FullImage"
                    static let avatar6 = "avatar06FullImage"
                    static let avatar7 = "avatar07FullImage"
                    static let avatar8 = "avatar08FullImage"
                    static let avatar9 = "avatar09FullImage"
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
                }
                
                struct CircleImage {
                    static let avatar1 = "avatar01CircleImage"
                    static let avatar2 = "avatar02CircleImage"
                    static let avatar3 = "avatar03CircleImage"
                    static let avatar4 = "avatar04CircleImage"
                    static let avatar5 = "avatar05CircleImage"
                    static let avatar6 = "avatar06CircleImage"
                    static let avatar7 = "avatar07CircleImage"
                    static let avatar8 = "avatar08CircleImage"
                    static let avatar9 = "avatar09CircleImage"
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
    
    struct DateFormats {
        static let projectDateFormat = "dd/MM/yyyy"
    }
}
