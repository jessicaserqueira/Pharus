//
//  SendFileCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol SendFileFlow {
    func showFileSentAlert()
}

class SendFileCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var project: ProjectModel
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
        self.project = project
    }
    
    func start() {
        let sendFilePresenter = SendFilePresenter(coordinator: self)
        let sendFileViewController = SendFileViewController(
            presenter: sendFilePresenter,
            coordinator: self
        )
        
        navigationController.present(sendFileViewController, animated: true)
    }
}

//MARK: - Actions

extension SendFileCoordinator: SendFileFlow {
    func showFileSentAlert() {
        let alertView = ConfirmationAlertView(
            message: "Arquivo enviado com sucesso!"
        )
        
        let alertCoordinator = ConfirmationAlertCoordinator(
            navigationController: navigationController,
            alertView: alertView
        )
        
        navigationController.topViewController?.dismiss(animated: true)
        coordinate(to: alertCoordinator)
    }
}

