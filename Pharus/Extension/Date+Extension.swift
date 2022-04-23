//
//  Date+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 02/04/22.
//

import Foundation

extension Date {    
    static func getDifferenceInDays(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.day], from: date, to: otherDate).day ?? 0
    }
}
