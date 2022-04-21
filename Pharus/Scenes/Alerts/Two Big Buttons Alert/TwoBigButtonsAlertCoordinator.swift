//
//  TwoBigButtonsAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol TwoBigButtonsAlertFlow {
    func closeModal()
}

class TwoBigButtonsAlertCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var alertView: TwoBigButtonsAlertView
    var project: ProjectModel
    
    init(
        navigationController: UINavigationController,
        alertView: TwoBigButtonsAlertView,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
        self.alertView = alertView
        self.project = project
    }
    
    func start() {
        let alertPresenter = TwoBigButtonsAlertPresenter(coordinator: self)
        let alertViewController = TwoBigButtonsAlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter)
        
        alertViewController.modalPresentationStyle = .overFullScreen
        
        navigationController.present(alertViewController, animated: true)
    }
}

extension TwoBigButtonsAlertCoordinator: TwoBigButtonsAlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
    
    //implementar
    func subscribeToProject() {
        project.isSubscribed = true
        closeModal()
    }
}



