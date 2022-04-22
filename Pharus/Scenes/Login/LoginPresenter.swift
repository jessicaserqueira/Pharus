//
//  LoginPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 28/03/22.
//

import Foundation

protocol LoginPresenterProtocol {
    func isValidEmail(email: String) -> Bool
    func isValidPassword(password: String) -> Bool
    func loginUser(email: String, password: String)
    func showChangePassword(email: String)
}

class LoginPresenter: LoginPresenterProtocol {
    
    //MARK: - Properties
    
    private var coordinator: LoginCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Actions
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = K.RegEx.emailRegEx
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = K.RegEx.passwordRegEx
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }
    
    func loginUser(email: String, password: String) {
        let student: Student = Bundle.main.decode("Student.json")
        let studentModel = makeStudentMode(with: student)
        
        coordinator.showHome(student: studentModel)
    }
    
    func showChangePassword(email: String) {
        let student: Student = Bundle.main.decode("Student.json")
        let studentModel = makeStudentMode(with: student)
        
        coordinator.showChangePassword(student: studentModel)
    }
    
    func makeStudentMode(with student: Student) -> StudentModel {
        var projectModelArray = [ProjectModel]()
        
        for project in student.projects {
            var taskModelArray = [TaskModel]()
            for task in project.tasks {
                let taskModel = TaskModel(
                    title: task.title,
                    isComplete: task.isComplete,
                    description: task.taskDescription
                )
                taskModelArray.append(taskModel)
            }
            let projectModel = ProjectModel(
                id: project.id,
                name: project.name,
                isSubscribed: project.isSubscribed,
                isComplete: project.isComplete,
                score: project.score,
                placement: project.placement,
                projectDescription: project.projectDescription,
                scoreDescription: project.scoreDescription,
                startDate: project.startDate,
                endDate: project.endDate,
                school: project.school,
                mentor: project.mentor,
                hasCompanyPartnership: project.hasCompanyPartnership,
                company: project.company,
                companyPhoto: project.companyPhoto,
                tasks: taskModelArray
            )
            projectModelArray.append(projectModel)
        }
        
        let studentModel = StudentModel(
            id: student.id,
            firstName: student.firstName,
            lastName: student.lastName,
            birthdate: student.birthdate,
            gender: student.gender,
            school: student.school,
            year: student.year,
            city: student.city,
            schoolShift: student.schoolShift,
            avatar: student.avatar,
            email: student.email,
            password: student.password,
            username: student.username,
            projects: projectModelArray
        )
        
        return studentModel
    }
}
