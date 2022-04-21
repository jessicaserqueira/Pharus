//
//  Task.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import Foundation

struct Task: Codable {
    let title: String
    let isComplete: Bool
    let taskDescription: String

    enum CodingKeys: String, CodingKey {
        case title, isComplete
        case taskDescription = "description"
    }
}
