//
//  ConfirmationAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol ConfirmationAlertFlow {
    func closeModal()
}

class ConfirmationAlertCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var alertView: ConfirmationAlertView
    
    init(navigationController: UINavigationController, alertView: ConfirmationAlertView) {
        self.navigationController = navigationController
        self.alertView = alertView
    }
    
    func start() {
        let alertPresenter = ConfirmationAlertPresenter(coordinator: self)
        let alertViewController = ConfirmationAlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter
        )
        
        alertViewController.modalPresentationStyle = .overFullScreen
        
        navigationController.present(alertViewController, animated: true)
    }
}

extension ConfirmationAlertCoordinator: ConfirmationAlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}

