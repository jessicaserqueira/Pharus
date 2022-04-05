//
//  TabBarCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

protocol TabBarFlow {
    func start()
    func showTabBar()
    
}

class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController, tabBarViewController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarViewController
    }
    
    func start() {
//        let HomeCoordinator =
        let userProjectsCoordinator = makeUserProjectsCoordinator()
        let userProjectsRankingCoordinator = makeUserProjectsRankingCoordinator()
//        let AvatarCoordinator =
//        let profileCoordinator =
    
        childCoordinators.append(userProjectsCoordinator)
        childCoordinators.append(userProjectsRankingCoordinator)
        
        tabBarViewController.setViewControllers([userProjectsCoordinator.navigationController, userProjectsRankingCoordinator.navigationController],
                                            animated: true)
        navigationController.setViewControllers([tabBarViewController], animated: true)

    }
    private func makeUserProjectsCoordinator() -> UserProjectsCoordinator {
        let coordinator = UserProjectsCoordinator(navigationController: UINavigationController())
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeUserProjectsRankingCoordinator() -> UserProjectsRankingCoordinator {
        let coordinator = UserProjectsRankingCoordinator(navigationController: UINavigationController())
        
        coordinator.start()
        
        return coordinator
    }
    
}

extension TabBarCoordinator: TabBarFlow {
    func showTabBar() {
        let coordinator = UserProjectsCoordinator(navigationController: navigationController)
        coordinate(to: coordinator)
        
    }
    
    func showLogin() {
       
        
    }


}
