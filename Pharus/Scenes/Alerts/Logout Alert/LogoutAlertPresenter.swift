//
//  LogoutAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol LogoutAlertPresenterProtocol {
    func closeModal()
    func logout()
}

class LogoutAlertPresenter: LogoutAlertPresenterProtocol {
    
    //MARK: - Properties
    
    private var coordinator: LogoutAlertCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: LogoutAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Actions
    
    func closeModal() {
        coordinator.closeModal()
    }
    
    func logout() {
        coordinator.logout()
    }
}

