//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginFlow {
    func showHome(student: Student)
}

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        let loginPresenter = LoginPresenter()
        
        loginPresenter.coordinator = self
        loginViewController.presenter = loginPresenter
        loginViewController.coordinator = self
        
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginFlow {
    func showHome(student: Student) {
        //Implementar tabbar
        let studentProjectsCoordinator = StudentProjectsCoordinator(navigationController: navigationController)
        studentProjectsCoordinator.student = student
        
        self.coordinate(to: studentProjectsCoordinator)
    }
}
