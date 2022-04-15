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
        static let uploadIcon = UIImage(named: K.Assets.Images.upload)
        static let bookIcon = UIImage(named: K.Assets.Icons.bookIcon)
        static let xmark = UIImage(systemName: K.Assets.Icons.xmark)
        static let checkmarkIcon = UIImage(named: K.Assets.Icons.checkboxCheckmarkButtonIcon)
        static let backButtonIcon = UIImage(named: K.Assets.Icons.backButton)
    }
    
    struct images {
        static let check = UIImage(named: "check")
    }
}

//struct Assets {
//
//    struct Icons {
//        static let backButton = "backButtonIcon"
//        static let bookIcon = "book"
//        static let hourglass = "hourglass"
//        static let rulesIcon = "rulesIcon"
//        static let feedbackIcon = "feedbackIcon"
//    }
//
//    struct Images {
//        static let medal = "medal"
//        static let companyLogo = "havaianas"
//        static let userPicture = "userPicture"
//        static let thirdPlace = "thirdPlace"
//        static let upload = "upload"
//    }
//}

