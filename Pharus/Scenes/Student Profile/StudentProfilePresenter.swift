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
    
    var coordinator: StudentProfileCoordinator
    
    init(coordinator: StudentProfileCoordinator) {
        self.coordinator = coordinator
    }

}

extension StudentProfilePresenter: StudentProfilePresenterProtocol {
    func showStudentProfile() {
        coordinator.showStudentProfile()
    }
    
    func showLogoutAlert() {
        coordinator.showLogOutAlert()
    }
}
