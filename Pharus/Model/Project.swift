//
//  Project.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import Foundation

class Project: Codable {
    var id, name: String
    var isSubscribed, isComplete: Bool
    var score, placement: Int?
    var projectDescription: String
    var scoreDescription: String?
    var startDate, endDate, school, rules: String
    var mentor: String
    var hasCompanyPartnership: Bool
    var company: String?
    var companyPhoto: String?
    var tasks: [Task]

    enum CodingKeys: String, CodingKey {
        case id, name, isSubscribed, isComplete, score, placement
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, school, rules, mentor, hasCompanyPartnership, company, companyPhoto, tasks
    }

    init(id: String, name: String, isSubscribed: Bool, isComplete: Bool, score: Int?, placement: Int?, projectDescription: String, scoreDescription: String?, startDate: String, endDate: String, school: String, rules: String, mentor: String, hasCompanyPartnership: Bool, company: String?, companyPhoto: String?, tasks: [Task]) {
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
        self.rules = rules
        self.mentor = mentor
        self.hasCompanyPartnership = hasCompanyPartnership
        self.company = company
        self.companyPhoto = companyPhoto
        self.tasks = tasks
    }
}

extension Project {
    var completedTasksCount: Int {
        var completedTasks = 0
        for task in self.tasks where task.isComplete {
            completedTasks += 1
        }
        return completedTasks
    }
    
    var completionPercentage: Float {
        Float(completedTasksCount)/Float(self.tasks.count)
    }
}
