//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginFlow {
    func start()
    
}

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.init()
        loginViewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginFlow {
    
    func showLogin() {
       
        
    }
}
