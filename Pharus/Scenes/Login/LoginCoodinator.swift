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
        let loginPresenter = LoginPresenter(coordinator: self)
        let loginViewController = LoginViewController(
            coordinator: self,
            presenter: loginPresenter
        )
    
        navigationController.setNavigationBarHidden(true, animated: true)
        
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginFlow {
    func showHome(student: Student) {
        let tabbarViewController = TabBarViewController()
        let tabbarCoordinator = TabBarCoordinator(
            navigationController: navigationController,
            tabBarViewController: tabbarViewController,
            student: student)
        
        coordinate(to: tabbarCoordinator)
    }
}
