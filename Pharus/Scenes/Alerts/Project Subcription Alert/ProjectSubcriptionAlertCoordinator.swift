//
//  ProjectSubcriptionAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol ProjectSubcriptionAlertFlow {
    func closeModal()
}

class ProjectSubcriptionAlertCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var alertView: ProjectSubcriptionAlertView
    var project: ProjectModel
    
    init(
        navigationController: UINavigationController,
        alertView: ProjectSubcriptionAlertView,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
        self.alertView = alertView
        self.project = project
    }
    
    func start() {
        let alertPresenter = ProjectSubcriptionAlertPresenter(coordinator: self)
        let alertViewController = ProjectSubcriptionAlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter)
        
        alertViewController.modalPresentationStyle = .fullScreen
        
        navigationController.present(alertViewController, animated: true)
    }
}

extension ProjectSubcriptionAlertCoordinator: ProjectSubcriptionAlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
    
    func subscribeToProject() {
        project.isSubscribed = true
        closeModal()
        
        let confirmationAlertView = ConfirmationAlertView(message: "Inscrição confirmada!")
        let confirmationAlertCoordinator = ConfirmationAlertCoordinator(
            navigationController: navigationController,
            alertView: confirmationAlertView
        )
        
        coordinate(to: confirmationAlertCoordinator)
    }
}



