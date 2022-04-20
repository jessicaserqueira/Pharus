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
    
    init(
        navigationController: UINavigationController,
        alertView: TwoBigButtonsAlertView
    ) {
        self.navigationController = navigationController
        self.alertView = alertView
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
        print("Inscrever no projeto")
        closeModal()
    }
}



