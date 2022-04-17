//
//  StudentProfilePresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import Foundation

protocol StudentProfilePresenterProtocol {
    func showStudentProfile()
}

class StudentProfilePresenter {
    
    var coordinator: StudentProfileFlow
    var studentProfileView: StudentProfileView
    
    init(coordinator: StudentProfileFlow, studentProfileView: StudentProfileView) {
        self.coordinator = coordinator
        self.studentProfileView = studentProfileView
    }

}

extension StudentProfilePresenter: StudentProfilePresenterProtocol{
    func showStudentProfile() {
        coordinator.showStudentProfile()
        
    }
}
