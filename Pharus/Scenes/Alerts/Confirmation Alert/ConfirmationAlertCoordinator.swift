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
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var alertView: ConfirmationAlertView
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        alertView: ConfirmationAlertView
    ) {
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

//MARK: - Actions
extension ConfirmationAlertCoordinator: ConfirmationAlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}


