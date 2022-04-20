//
//  TwoBigButtonsAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol TwoBigButtonsAlertPresenterProtocol {
    func closeModal()
    func subscribeToProject()
}

class TwoBigButtonsAlertPresenter: TwoBigButtonsAlertPresenterProtocol {
    
    var coordinator: TwoBigButtonsAlertCoordinator
    
    init(coordinator: TwoBigButtonsAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    func closeModal() {
        coordinator.closeModal()
    }
    
    func subscribeToProject() {
        coordinator.subscribeToProject()
    }
}