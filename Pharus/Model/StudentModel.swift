//
//  Student.swift
//  Pharus
//
//  Created by Victor Colen on 22/03/22.
//
import Foundation

class StudentModel: Codable {
    
    //MARK: - Properties
    
    var id: String
    let firstName: String
    let lastName: String
    let birthdate: String
    let gender: String
    let school: String
    var year: String
    var city: String
    var schoolShift: String
    var avatar: String
    var email: String
    var password: String
    var username: String
    var projects: [ProjectModel]
    
    //MARK: - Initializer
    
    init(
        id: String,
        firstName: String,
        lastName: String,
        birthdate: String,
        gender: String,
        school: String,
        year: String,
        city: String,
        schoolShift: String,
        avatar: String,
        email: String,
        password: String,
        username: String,
        projects: [ProjectModel]
    ) {
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
        self.password = password
        self.username = username
        self.projects = projects
    }
}

extension StudentModel {
    static let defaultProject = ProjectModel(
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
        mentor: "Yo el brabo",
        company: "ioasys",
        tasks: [
            TaskModel(title: "Terminar projeto", isComplete: true, description: "Teste")
        ]
    )
}
