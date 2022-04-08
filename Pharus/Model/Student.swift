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
    let isComplete: Bool
    let score: Float?
    let medal: String?
    let projectDescription, scoreDescription, startDate, endDate: String
    let school, rules, mentor: String
    let hasCompanyPartnership: Bool
    let company: String?
    let companyPhoto: String?
    let completionStatus: Float
    let tasks: [Task]

    enum CodingKeys: String, CodingKey {
        case id, name, isComplete, score, medal
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, school, rules, mentor, hasCompanyPartnership, company, companyPhoto, completionStatus, tasks
    }
}

// MARK: - Task
struct Task: Codable {
    let title: String
    let isComplete: Bool
    let taskDescription: String

    enum CodingKeys: String, CodingKey {
        case title, isComplete
        case taskDescription = "description"
    }
}
