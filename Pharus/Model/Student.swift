//
//  Student.swift
//  Pharus
//
//  Created by Victor Colen on 22/03/22.
//

import Foundation

// MARK: - Student
struct Student: Codable {
    let name: Name
    let birthday, schoolID, gender: String
    let phoneNumbers: [PhoneNumber]
    let school, schoolShift: String
    let avatar, backgroundPhoto: String
    let medals: Medals
    let score: Int
    let schoolProjects, companyProjects: [Project]

    enum CodingKeys: String, CodingKey {
        case name, birthday
        case schoolID = "schoolId"
        case gender, phoneNumbers, school, schoolShift, avatar, backgroundPhoto, medals, score, schoolProjects, companyProjects
    }
}

// MARK: - Project
struct Project: Codable {
    let name: String
    let score: Int
    let medal, projectDescription, scoreDescription, startDate: String
    let endDate, rules: String
    let mentor: String
    let completionStatus: Float

    enum CodingKeys: String, CodingKey {
        case name, score, medal
        case projectDescription = "description"
        case scoreDescription, startDate, endDate, rules, mentor
        case completionStatus
    }
}

// MARK: - Medals
struct Medals: Codable {
    let diamond, ruby, emerald, saphire: Int
    let platinum, gold, silver, bronze: Int
}

// MARK: - Name
struct Name: Codable {
    let firstName, lastName: String
}

// MARK: - PhoneNumber
struct PhoneNumber: Codable {
    let type, number: String
}

