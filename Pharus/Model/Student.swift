//
//  Student.swift
//  Pharus
//
//  Created by Victor Colen on 22/03/22.
//
import Foundation

// MARK: - Student
struct Student: Codable {
    let id, firstName, lastName, birthdate: String
    let schoolID, gender, phone, school: String
    let schoolShift: String
    let avatar: String
    let email, username: String
    let year: String
    let city: String
    let score: Float
    let medals: Medals
    let projects: [Project]
}

// MARK: - Medals
struct Medals: Codable {
    let diamond, ruby, emerald, saphire: Int
    let platinum, gold, silver, bronze: Int
}

// MARK: - Project
struct Project: Codable {
    let id, name: String
    let isSubscribed: Bool
    let placement: Int?
    let isComplete: Bool
    let score: Float?
    let medal: String?
    let scoreDescription: String?
    let projectDescription, startDate, endDate: String
    let school, rules, mentor: String
    let hasCompanyPartnership: Bool
    let company: String?
    let companyPhoto: String?
    let completionStatus: Float
    let tasks: [Task]

    enum CodingKeys: String, CodingKey {
        case id, name, isComplete, score, medal
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, school, rules, mentor, hasCompanyPartnership, company, companyPhoto, completionStatus, tasks, isSubscribed, placement
    }
}

// MARK: - Task
class Task: Codable {
    let title: String
    var isComplete: Bool
    let taskDescription: String
    
    init(title: String, isComplete: Bool, description: String) {
        self.title = title
        self.isComplete = isComplete
        self.taskDescription = description
    }

    enum CodingKeys: String, CodingKey {
        case title, isComplete
        case taskDescription = "description"
    }
}

extension Task {
    func toggleCompletionStatus() {
        isComplete.toggle()
    }
}

extension Student {
    static let defaultProject = Project(
        id: "1",
        name: "El Projeto",
        isSubscribed: true,
        placement: 2,
        isComplete: false,
        score: 100,
        medal: "diamond",
        scoreDescription: " bela nota parabens",
        projectDescription: "Lorem ipsum",
        startDate: "22/03/2021",
        endDate: "25/05/2023",
        school: "Batista",
        rules: "Siga as regras",
        mentor: "Yo el brabo",
        hasCompanyPartnership: false,
        company: nil,
        companyPhoto: nil,
        completionStatus: 100,
        tasks: [
            Task(title: "Terminar projeto", isComplete: true, description: "Teste")
        ]
    )
}
