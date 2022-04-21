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
        let studentProfileCoordinator = makeStudentProfileCoordinator()
        
        childCoordinators.append(studentHomeCoordinator)
        childCoordinators.append(studentProjectsCoordinator)
        childCoordinators.append(studentAvatarCoordinator)
        childCoordinators.append(studentProjectsRankingCoordinator)
        childCoordinators.append(studentProfileCoordinator)
        
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
        
        studentHomeCoordinator
            .navigationController
            .tabBarController?
            .tabBar
            .backgroundColor = UIColor.tabbar.blueBackground
        
        studentHomeCoordinator
            .navigationController
            .tabBarController?
            .tabBar
            .barTintColor = UIColor.tabbar.blueBackground
        
        studentHomeCoordinator
            .navigationController
            .tabBarController?
            .tabBar
            .tintColor = .none
        
        studentHomeCoordinator
            .navigationController
            .tabBarController?
            .tabBar
            .unselectedItemTintColor = UIColor.tabbar.whiteTint
        
        studentHomeCoordinator
            .navigationController
            .tabBarController?
            .tabBar
            .isTranslucent = false
        
        studentHomeCoordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.homeTabBarIcon
        
        studentHomeCoordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.homeTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        studentProjectsCoordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.projecsTabBarIcon
        
        studentProjectsCoordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.projecsTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        studentProjectsRankingCoordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.rankingTabBarIcon
        
        studentProjectsRankingCoordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.rankingTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        studentAvatarCoordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.avatarTabBarIcon
        
        studentAvatarCoordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.avatarTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        studentProfileCoordinator
            .navigationController
            .tabBarItem
            .image = UIImage.icons.profileTabBarIcon
        
        studentProfileCoordinator
            .navigationController
            .tabBarItem
            .selectedImage = UIImage.icons.profileTabBarIconSelected?.withRenderingMode(.alwaysOriginal)
        
        navigationController.setViewControllers([tabBarViewController], animated: true)
    }
    
    private func makeStudentHomeCoordinator() -> StudentHomeCoordinator {
        let coordinator = StudentHomeCoordinator(
            navigationController: UINavigationController(),
            student: student
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
    
    private func makeStudentAvatarCoordinator() -> AvatarSelectionCoordinator {
        let coordinator = AvatarSelectionCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator.start()
        
        return coordinator
    }
    
    private func makeStudentProfileCoordinator() -> StudentProfileCoordinator {
        let coordinator = StudentProfileCoordinator(
            navigationController: UINavigationController(),
            student: student
        )
        
        coordinator.start()
        
        return coordinator
    }
    
}

extension TabBarCoordinator: TabBarFlow {
    
}
