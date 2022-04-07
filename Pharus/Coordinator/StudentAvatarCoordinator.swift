//
//  StudentAvatarCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

protocol StudentAvatarFlow {
    func start()
}

class StudentAvatarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let studentAvatarViewController = StudentAvatarViewController()
        studentAvatarViewController.coordinator = self
        studentAvatarViewController.tabBarItem.image = UIImage(named: "AvatarTabBar.fill")
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentAvatarViewController, animated: true)
    }
}

extension StudentAvatarCoordinator: StudentAvatarFlow {
    

}
