//
//  LogoutAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol LogoutAlertFlow {
    func closeModal()
    func logout()
}

class LogoutAlertCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var alertView: LogoutAlertView
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        alertView: LogoutAlertView
    ) {
        self.navigationController = navigationController
        self.alertView = alertView
    }
    
    func start() {
        let alertPresenter = LogoutAlertPresenter(coordinator: self)
        let alertViewController = LogoutAlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter)
        
        alertViewController.modalPresentationStyle = .overFullScreen
        
        navigationController.present(alertViewController, animated: true)
    }
}

//MARK: - Actions

extension LogoutAlertCoordinator: LogoutAlertFlow {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
    
    func logout() {
        closeModal()
        let loginCoordinator = LoginCoordinator(
            navigationController: navigationController
        )
        
        coordinate(to: loginCoordinator)
    }
}
