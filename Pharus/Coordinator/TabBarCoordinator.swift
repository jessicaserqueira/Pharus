//
//  TabBarCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

protocol TabBarFlow {

}

class TabBarCoordinator: Coordinator {
    
    private var student: Student
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController
    var childCoordinators: [Coordinator] = []
    
    init(
        navigationController: UINavigationController,
        tabBarViewController: UITabBarController,
        student: Student
    ) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarViewController
        self.student = student
    }
    
    func start() {
        let studentHomeCoordinator = makeStudentHomeCoordinator()
        let studentProjectsCoordinator = makeStudentProjectsCoordinator()
        let studentProjectsRankingCoordinator = makeStudentProjectsRankingCoordinator()
        let studentAvatarCoordinator = makeStudentAvatarCoordinator()
        
        childCoordinators.append(studentHomeCoordinator)
        childCoordinators.append(studentProjectsCoordinator)
        childCoordinators.append(studentAvatarCoordinator)
        childCoordinators.append(studentProjectsRankingCoordinator)
        
        
        tabBarViewController.setViewControllers(
            [
                studentHomeCoordinator.navigationController,
                studentProjectsCoordinator.navigationController,
                studentProjectsRankingCoordinator.navigationController,
                studentAvatarCoordinator.navigationController
            ],
            animated: true
        )
        navigationController.setViewControllers([tabBarViewController], animated: true)
    }
    
    private func makeStudentHomeCoordinator() -> StudentHomeCoordinator {
        let coordinator = StudentHomeCoordinator(
            navigationController: UINavigationController()
        )
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentProjectsCoordinator() -> StudentProjectsCoordinator {
        let coordinator = StudentProjectsCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentProjectsRankingCoordinator() -> StudentProjectsRankingCoordinator {
        let coordinator = StudentProjectsRankingCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentAvatarCoordinator() -> StudentAvatarCoordinator {
        let coordinator = StudentAvatarCoordinator(
            navigationController: UINavigationController()
        )
        
        coordinator.start()
        
        return coordinator
    }
    
}

extension TabBarCoordinator: TabBarFlow {
    
}
