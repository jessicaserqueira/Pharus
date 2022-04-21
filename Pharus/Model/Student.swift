//
//  Student.swift
//  Pharus
//
//  Created by Victor Colen on 22/03/22.
//
import Foundation

// MARK: - Student
class Student: Codable {
    var id, firstName, lastName, birthdate: String
    var gender, school, year, city: String
    var schoolShift: String
    var avatar: String
    var email, username: String
    var projects: [Project]

    init(id: String, firstName: String, lastName: String, birthdate: String, gender: String, school: String, year: String, city: String, schoolShift: String, avatar: String, email: String, username: String, projects: [Project]) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.gender = gender
        self.school = school
        self.year = year
        self.city = city
        self.schoolShift = schoolShift
        self.avatar = avatar
        self.email = email
        self.username = username
        self.projects = projects
    }
}

extension Student {
    static let defaultProject = Project(
        id: "1",
        name: "El Projeto",
        isSubscribed: true,
        isComplete: true,
        score: 100,
        placement: 2,
        projectDescription: "Lorem ipsum",
        scoreDescription: "bela nota parabens",
        startDate: "22/03/2021",
        endDate: "25/05/2023",
        school: "Batista",
        rules: "Siga as regras",
        mentor: "Yo el brabo",
        hasCompanyPartnership: false,
        company: nil,
        companyPhoto: nil,
        tasks: [
            Task(title: "Terminar projeto", isComplete: true, description: "Teste")
        ]
    )
}
