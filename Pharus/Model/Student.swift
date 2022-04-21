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
