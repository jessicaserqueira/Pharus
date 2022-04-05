//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

protocol UserProjectsFlow {
    func start()
}

class UserProjectsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let userProjectsViewController = UserProjectsViewController()
        userProjectsViewController.coordinator = self
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(userProjectsViewController, animated: true)
    }
}

extension UserProjectsCoordinator: UserProjectsFlow {
    
    func showUserProjects() {
       
        
    }
}

