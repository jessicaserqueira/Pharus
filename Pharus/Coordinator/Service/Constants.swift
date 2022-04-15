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
            static let backButton = "backButtonIcon"
            static let bookIcon = "book"
            static let hourglass = "hourglass"
            static let rulesIcon = "rulesIcon"
            static let feedbackIcon = "feedbackIcon"
            static let xmark = "xmark"
            static let checkboxCheckmarkButtonIcon = "checkboxCheckmarkIcon"
        }
        
        struct Images {
            static let medal = "medal"
            static let companyLogo = "havaianas"
            static let userPicture = "userPicture"
            static let thirdPlace = "thirdPlace"
            static let upload = "upload"
        }
    }
    
    struct DateFormats {
        static let projectDateFormat = "dd/MM/yyyy"
    }
}

