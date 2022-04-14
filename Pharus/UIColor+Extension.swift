//
//  UIColor+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 30/03/22.
//

import UIKit

extension UIColor {
    struct Project {
        static let disabledProjectBackgroundColor = UIColor(
            red: 0.992,
            green: 0.925,
            blue: 0.733,
            alpha: 1
        )
        
        static let subscribedProjectBackgroundColor = UIColor(
            red: 0.992,
            green: 0.627,
            blue: 0.286,
            alpha: 1
        )
        
        static let unsubscribedProjectBackgroundColor = UIColor(
            red: 0.808,
            green: 0.808,
            blue: 0.82,
            alpha: 1
        )
        
        static let completedPodiumProject = UIColor(
            red: 0.475,
            green: 0.176,
            blue: 0.914,
            alpha: 1
        )
    }
    
    struct Modal {
        static let modalBackgroundColor = UIColor(
            red: 0.992,
            green: 0.863,
            blue: 0.631,
            alpha: 1
        )
    }
    
    struct Button {
        static let mainButtonBackgroundColor = UIColor(
            red: 0.361,
            green: 0.145,
            blue: 0.776,
            alpha: 1
        )
        
        static let mainButtonTextColor = UIColor(
            red: 0.945,
            green: 0.945,
            blue: 0.949,
            alpha: 1
        )
    }
    
    struct Card {
        static let homeStandardCardBackgroundColor = UIColor(
            red: 0.988,
            green: 0.729,
            blue: 0.478,
            alpha: 1
        )
        
        static let homeAlertCardBackgroundColor = UIColor(
            red: 0.9,
            green: 0.87,
            blue: 0,
            alpha: 1
        )
    }
}
