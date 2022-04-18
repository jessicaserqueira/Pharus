//
//  AlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol AlertFlow {
    func closeModal()
}

class AlertCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var alertView: AlertView
    
    init(navigationController: UINavigationController, alertView: AlertView) {
        self.navigationController = navigationController
        self.alertView = alertView
    }
    
    func start() {
        let alertPresenter = AlertPresenter(coordinator: self)
        let alertViewController = AlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter
        )
        
        alertViewController.modalPresentationStyle = .overFullScreen
        
        navigationController.present(alertViewController, animated: true)
    }
}

extension AlertCoordinator: AlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}


