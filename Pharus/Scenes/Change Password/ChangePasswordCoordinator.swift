//
//  ChangePasswordCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import UIKit

protocol ChangePasswordFlow {
    func showChangePassword()
    func showLogoutChangePassword()
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
        let changePasswordPresenter = ChangePasswordPresenter(coordinator: self)
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
    func showChangePassword(){
        let alertView = ConfirmationAlertView(
            message: "Senha salva com sucesso"
        )
        let alertCoordinator = ConfirmationAlertCoordinator(
            navigationController: navigationController,
            alertView: alertView
            
        )
        coordinate(to: alertCoordinator)
        
    }
    func showLogoutChangePassword(){
        let coordinator = LoginCoordinator(
            navigationController: navigationController
        )
        navigationController.dismiss(animated: true)
        coordinate(to: coordinator)
    }
}


