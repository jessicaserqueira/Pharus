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
    
    init(coordinator: StudentProfileFlow) {
        self.coordinator = coordinator
    }

}

extension StudentProfilePresenter: StudentProfilePresenterProtocol{
    func showStudentProfile() {
        coordinator.showStudentProfile()
    }
}
