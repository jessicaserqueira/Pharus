//
//  ProjectSubcriptionAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol ProjectSubcriptionPresenterProtocol {
    func closeModal()
    func subscribeToProject()
}

class ProjectSubcriptionAlertPresenter: ProjectSubcriptionPresenterProtocol {
    
    var coordinator: ProjectSubcriptionAlertCoordinator
    
    init(coordinator: ProjectSubcriptionAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    func closeModal() {
        coordinator.closeModal()
    }
    
    func subscribeToProject() {
        coordinator.subscribeToProject()
    }
}
