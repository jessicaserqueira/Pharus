//
//  SendFileCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol SendFileFlow {
    func showUploadFile()
    func showFileSentAlert()
}

class SendFileCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var project: Project
    
    init(navigationController: UINavigationController, project: Project) {
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

extension SendFileCoordinator: SendFileFlow {
    func showUploadFile() {
     
    }

    func showFileSentAlert() {

    let alertView = AlertView(
        message: "Arquivo enviado com sucesso!",
        image: UIImage.icons.checkIcon ?? .defaultImage
    )

    let alertCoordinator = AlertCoordinator(
        navigationController: navigationController,
        alertView: alertView
    )
     
           navigationController.topViewController?.dismiss(animated: true)
        coordinate(to: alertCoordinator)
}
}

