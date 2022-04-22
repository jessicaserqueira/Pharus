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
    
    //MARK: - Properties
    
    private var coordinator: ProjectSubcriptionAlertCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: ProjectSubcriptionAlertCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Actions
    
    func closeModal() {
        coordinator.closeModal()
    }
    
    func subscribeToProject() {
        coordinator.subscribeToProject()
    }
}
