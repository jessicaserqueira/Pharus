//
//  StudentProfilePresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import Foundation

protocol StudentProfilePresenterProtocol { }

class StudentProfilePresenter {
    
    //MARK: - Properties
    
    private var coordinator: StudentProfileCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: StudentProfileCoordinator) {
        self.coordinator = coordinator
    }
}

//MARK: - Actions

extension StudentProfilePresenter: StudentProfilePresenterProtocol {
    func showLogoutAlert() {
        coordinator.showLogOutAlert()
    }
}
