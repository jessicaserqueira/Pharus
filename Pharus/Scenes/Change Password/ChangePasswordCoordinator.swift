//
//  ChangePasswordCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import UIKit

protocol ChangePasswordFlow {
    func showConfirmationAlert()
    func closeChangePasswordView()
}

class ChangePasswordCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var student: StudentModel
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }
    
    func start() {
        let changePasswordPresenter = ChangePasswordPresenter(
            coordinator: self,
            student: student
        )
        let changePasswordViewController = ChangePasswordViewController(
            coordinator: self,
            presenter: changePasswordPresenter
        )
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.setViewControllers([changePasswordViewController], animated: true)
        
    }
}

//MARK: - Actions

extension ChangePasswordCoordinator: ChangePasswordFlow {
    func showConfirmationAlert() {
        let alertView = ConfirmationAlertView(
            message: "Senha salva com sucesso"
        )
        let alertCoordinator = ConfirmationAlertCoordinator(
            navigationController: navigationController,
            alertView: alertView
        )
        coordinate(to: alertCoordinator)
    }
    
    func closeChangePasswordView() {
        let coordinator = LoginCoordinator(
            navigationController: navigationController
        )
        navigationController.dismiss(animated: true)
        coordinate(to: coordinator)
    }
}


