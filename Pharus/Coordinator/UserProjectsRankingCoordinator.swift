//
//  UserProjectsRankingCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

protocol UserProjectsRankingFlow {
    func start()
}

class UserProjectsRankingCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let userProjectsRankingViewController = UserRankingProjectsViewController()
        userProjectsRankingViewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(userProjectsRankingViewController, animated: true)
    }
}

extension UserProjectsRankingCoordinator: UserProjectsRankingFlow {
    
    func showUserProjectsRanking() {
       
        
    }
}
