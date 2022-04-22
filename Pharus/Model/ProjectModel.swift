//
//  Project.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import Foundation

class ProjectModel: Codable {
    
    //MARK: - Properties
    
    var id: String
    let name: String
    var isSubscribed: Bool
    var isComplete: Bool
    var score: Int?
    var placement: Int?
    var projectDescription: String
    var scoreDescription: String?
    var startDate: String
    var endDate: String
    var school: String
    var mentor: String
    var company: String?
    var tasks: [TaskModel]
    
    enum CodingKeys: String, CodingKey {
        case id, name, isSubscribed, isComplete, score, placement
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, school, mentor, company, tasks
    }
    
    //MARK: - Initializer
    
    init(
        id: String,
        name: String,
        isSubscribed: Bool,
        isComplete: Bool,
        score: Int?,
        placement: Int?,
        projectDescription: String,
        scoreDescription: String?,
        startDate: String,
        endDate: String,
        school: String,
        mentor: String,
        company: String,
        tasks: [TaskModel]
    ) {
        self.id = id
        self.name = name
        self.isSubscribed = isSubscribed
        self.isComplete = isComplete
        self.score = score
        self.placement = placement
        self.projectDescription = projectDescription
        self.scoreDescription = scoreDescription
        self.startDate = startDate
        self.endDate = endDate
        self.school = school
        self.mentor = mentor
        self.company = company
        self.tasks = tasks
    }
}

extension ProjectModel {
    var completedTasksCount: Int {
        self.tasks.filter { $0.isComplete }.count
    }
    
    var completionPercentage: Float {
        Float(completedTasksCount)/Float(self.tasks.count)
    }
    
    var daysRemaining: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = K.DateFormats.projectDateFormat
        
        let projectEndDate = dateFormatter.date(from: self.endDate) ?? Date()
        let daysRemaining = Date.getDifferenceInDays(
            between: Date(),
            and: projectEndDate
        )
        
        return daysRemaining
    }
}
