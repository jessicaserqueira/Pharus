//
//  OneButtonAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol OneButtonAlertPresenterProtocol {
   func closeModal()
}

class OneButtonAlertPresenter: OneButtonAlertPresenterProtocol {
    
    var coordinator: OneButtonAlertCoordinator
    
    init(coordinator: OneButtonAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    func closeModal() {
        coordinator.closeModal()
    }
}
