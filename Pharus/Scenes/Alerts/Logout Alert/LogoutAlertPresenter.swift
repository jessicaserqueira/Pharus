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
    
    var coordinator: LogoutAlertCoordinator
    
    init(coordinator: LogoutAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    func closeModal() {
        coordinator.closeModal()
    }
    
    func logout() {
        coordinator.logout()
    }
}

