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
    
    //MARK: - Properties
    
    private var student: StudentModel
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController
    var childCoordinators: [Coordinator] = []
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        tabBarViewController: UITabBarController,
        student: StudentModel
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
        let studentProfileCoordinator = makeStudentProfileCoordinator()
        
        childCoordinators = [
            studentHomeCoordinator,
            studentProjectsCoordinator,
            studentAvatarCoordinator,
            studentProjectsRankingCoordinator,
            studentProfileCoordinator
        ]
        
        tabBarViewController.setViewControllers(
            [
                studentHomeCoordinator.navigationController,
                studentProjectsCoordinator.navigationController,
                studentProjectsRankingCoordinator.navigationController,
                studentAvatarCoordinator.navigationController,
                studentProfileCoordinator.navigationController
            ],
            animated: true
        )
        
        navigationController.setViewControllers([tabBarViewController], animated: true)
    }
    
    //MARK: - Actions
    
    private func makeStudentHomeCoordinator() -> StudentHomeCoordinator {
        let coordinator = StudentHomeCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator
            .navigationController
            .tabBarController?
            .tabBar
            .backgroundColor = UIColor.tabbar.blueBackground
        
        coordinator
            .navigationController
            .tabBarController?
            .tabBar
            .barTintColor = UIColor.tabbar.blueBackground
        
        coordinator
            .navigationController
            .tabBarController?
            .tabBar
            .tintColor = .none
        
        coordinator
            .navigationController
            .tabBarController?
            .tabBar
            .unselectedItemTintColor = UIColor.tabbar.whiteTint
        
        coordinator
            .navigationController
            .tabBarController?
            .tabBar
            .isTranslucent = false
        
        coordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.homeTabBarIcon
        
        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.homeTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentProjectsCoordinator() -> StudentProjectsCoordinator {
        let coordinator = StudentProjectsCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.projecsTabBarIcon
        
        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.projecsTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentProjectsRankingCoordinator() -> StudentProjectsRankingCoordinator {
        let coordinator = StudentProjectsRankingCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.rankingTabBarIcon
        
        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.rankingTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentAvatarCoordinator() -> AvatarSelectionCoordinator {
        let coordinator = AvatarSelectionCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.avatarTabBarIcon
        
        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.avatarTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentProfileCoordinator() -> StudentProfileCoordinator {
        let coordinator = StudentProfileCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.profileTabBarIcon
        
        
        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.profileTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        coordinator.start()
        
        return coordinator
    }
}

extension TabBarCoordinator: TabBarFlow {
    
}
