//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginFlow {
    func showHome(student: StudentModel)
}

class LoginCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    //MARK: - Initializer
    
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
        navigationController.tabBarController?.tabBar.isHidden = true
        navigationController.setViewControllers([loginViewController], animated: true)
    }
}

//MARK: - Actions

extension LoginCoordinator: LoginFlow {
    
    func showHome(student: StudentModel) {
        let tabbarViewController = TabBarViewController()
        let tabbarCoordinator = TabBarCoordinator(
            navigationController: navigationController,
            tabBarViewController: tabbarViewController,
            student: student)
        
        coordinate(to: tabbarCoordinator)
    }
}
