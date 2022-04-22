//
//  ConfirmationAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol ConfirmationAlertPresenterProtocol {
   func closeModal()
}

class ConfirmationAlertPresenter: ConfirmationAlertPresenterProtocol {
    
    var coordinator: ConfirmationAlertCoordinator
    
    init(coordinator: ConfirmationAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    func closeModal() {
        coordinator.closeModal()
    }
}
