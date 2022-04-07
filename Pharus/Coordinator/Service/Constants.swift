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
    
    struct AssetsNames {
        static let backButton = "backButtonImage"
        static let medal = "medal"
        static let companyLogo = "havaianas"
        static let hourglass = "hourglass"
        static let userPicture = "userPicture"
        static let thirdPlace = "thirdPlace"
        static let upload = "upload"
        static let book = "book"
    }
    
    struct DateFormats {
        static let projectDateFormat = "dd/MM/yyyy"
    }
}

