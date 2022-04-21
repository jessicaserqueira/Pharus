//
//  Task.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import Foundation

class TaskModel: Codable {
    let title: String
    var isComplete: Bool
    let taskDescription: String
    
    init(
        title: String,
        isComplete: Bool,
        description: String
    ) {
        self.title = title
        self.isComplete = isComplete
        self.taskDescription = description
    }
    
    enum CodingKeys: String, CodingKey {
        case title, isComplete
        case taskDescription = "description"
    }
}

extension TaskModel {
    func toggleCompletionStatus() {
        isComplete.toggle()
    }
}
