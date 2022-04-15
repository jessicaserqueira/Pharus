//
//  StudentProfilePresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 14/04/22.
//

import Foundation

protocol StudentProfilePresenterProtocol {
    func showStudentProfile(student: Student)
}

class StudentProfilePresenter: StudentProfilePresenterProtocol {
    var coordinator: StudentProfileCoordinator?
    
    func showStudentProfile(student: Student) {
        coordinator?.showStudentProfile(student: student)
    }
}
