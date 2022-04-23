//
//  CGFloat+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 31/03/22.
//

import UIKit

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
