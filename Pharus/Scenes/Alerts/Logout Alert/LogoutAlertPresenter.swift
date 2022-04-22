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
    
    var coordinator: LogoutAlertCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: LogoutAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Logout Alert Presenter Protocol
    
    func closeModal() {
        coordinator.closeModal()
    }
    
    func logout() {
        coordinator.logout()
    }
}

