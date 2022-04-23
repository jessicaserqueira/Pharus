//
//  SingleButtonAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol SingleButtonAlertPresenterProtocol {
    func closeModal()
}

class SingleButtonAlertPresenter: SingleButtonAlertPresenterProtocol {
    
    //MARK: - Properties
    
    private var coordinator: SingleButtonAlertCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: SingleButtonAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Actions
    
    func closeModal() {
        coordinator.closeModal()
    }
}
