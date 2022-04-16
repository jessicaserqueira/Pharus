//
//  AlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol AlertPresenterProtocol {
   func closeModal()
}

class AlertPresenter: AlertPresenterProtocol {
    
    var coordinator: AlertCoordinator
    
    init(coordinator: AlertCoordinator) {
        self.coordinator = coordinator
    }
    
    func closeModal() {
        coordinator.closeModal()
    }
}
