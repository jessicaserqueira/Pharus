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
    
    //MARK: - Properties
    
    var coordinator: ConfirmationAlertCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: ConfirmationAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Actions
    
    func closeModal() {
        coordinator.closeModal()
    }
}
