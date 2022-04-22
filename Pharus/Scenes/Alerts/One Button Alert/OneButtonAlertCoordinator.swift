//
//  OneButtonAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol OneButtonAlertFlow {
    func closeModal()
}

class OneButtonAlertCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var alertView: ConfirmationAlertView
    
    init(navigationController: UINavigationController, alertView: ConfirmationAlertView) {
        self.navigationController = navigationController
        self.alertView = alertView
    }
    
    func start() {
        let alertPresenter = OneButtonAlertPresenter(coordinator: self)
        let alertViewController = ConfirmationAlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter
        )
        
        alertViewController.modalPresentationStyle = .overFullScreen
        
        navigationController.present(alertViewController, animated: true)
    }
}

extension OneButtonAlertCoordinator: OneButtonAlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}


