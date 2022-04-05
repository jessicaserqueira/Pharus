//
//  Date+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 02/04/22.
//

import Foundation

extension Date {
   static func getDifferenceInYears(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.year], from: date, to: otherDate).year ?? 0
    }
    
    static func getDifferenceInMonths(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.month], from: date, to: otherDate).month ?? 0
    }
    
    static func getDifferenceInWeeks(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.weekOfMonth], from: date, to: otherDate).weekOfMonth ?? 0
    }
    
    static func getDifferenceInDays(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.day], from: date, to: otherDate).day ?? 0
    }
    
    static func getDifferenceInHours(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.hour], from: date, to: otherDate).hour ?? 0
    }
    
    static func getDifferenceInMinutes(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.minute], from: date, to: otherDate).minute ?? 0
    }
    
    static func getDifferenceInSeconds(between date: Date, and otherDate: Date) -> Int {
        Calendar.current.dateComponents([.second], from: date, to: otherDate).second ?? 0
    }
}
