//
//  SingleButtonAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol SingleButtonAlertFlow {
    func closeModal()
}

class SingleButtonAlertCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var alertView: SingleButtonAlertView
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        alertView: SingleButtonAlertView
    ) {
        self.navigationController = navigationController
        self.alertView = alertView
    }
    
    func start() {
        let alertPresenter = SingleButtonAlertPresenter(coordinator: self)
        let alertViewController = SingleButtonAlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter
        )
        
        alertViewController.modalPresentationStyle = .overFullScreen
         
        navigationController.present(alertViewController, animated: true)
    }
}

//MARK: - Actions
extension SingleButtonAlertCoordinator: SingleButtonAlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}


