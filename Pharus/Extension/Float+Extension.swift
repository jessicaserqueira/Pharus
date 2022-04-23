//
//  Float+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 22/04/22.
//

import Foundation

extension Float {
    func withDecimalPoints(_ decimalPoints: Int) -> String {
        return String(format: "%.\(decimalPoints)f", self)
    }
}
