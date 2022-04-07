//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginFlow {
    func start()
    func showHome()
    
}

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.tabBarController?.tabBar.isHidden = true
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginFlow {
    func showHome() {
        let coordinator = TabBarCoordinator(navigationController: navigationController, tabBarViewController: UITabBarController())
            coordinate(to: coordinator)
        
    }
    
    func showLogin() {
       
        
    }
}
