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
        let studentProjectsCoordinator = makeUserProjectsCoordinator()
        let studentProjectDetailCoordinator = makeStudentProjectDetailCoordinator()
        let userProjectsRankingCoordinator = makeUserProjectsRankingCoordinator()
        let studentAvatarCoordinator = makeStudentAvatarCoordinato()
        
        childCoordinators.append(studentProjectsCoordinator)
        childCoordinators.append(studentProjectDetailCoordinator)
        childCoordinators.append(userProjectsRankingCoordinator)
        childCoordinators.append(studentAvatarCoordinator)
        
        tabBarViewController.setViewControllers([studentProjectsCoordinator.navigationController, studentProjectDetailCoordinator.navigationController, userProjectsRankingCoordinator.navigationController,
            studentAvatarCoordinator.navigationController],
                                                animated: true)
        navigationController.setViewControllers([tabBarViewController], animated: true)
        
    }
    private func makeUserProjectsCoordinator() -> StudentProjectsCoordinator {
        let coordinator = StudentProjectsCoordinator(navigationController: UINavigationController())
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeUserProjectsRankingCoordinator() -> UserProjectsRankingCoordinator {
        let coordinator = UserProjectsRankingCoordinator(navigationController: UINavigationController())
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentProjectDetailCoordinator() -> StudentProjectDetailCoordinator {
        let coordinator = StudentProjectDetailCoordinator(navigationController: UINavigationController())
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentAvatarCoordinato() -> StudentAvatarCoordinator {
        let coordinator = StudentAvatarCoordinator(navigationController: UINavigationController())
        
        coordinator.start()
        
        return coordinator
    }

}

extension TabBarCoordinator: TabBarFlow {
    func showTabBar() {
        let coordinator = StudentProjectsCoordinator(navigationController: navigationController)
        coordinate(to: coordinator)
        
    }
    
    func showLogin() {
        
        
    }
    
    
}
