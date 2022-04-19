//
//  AvatarSelectionCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

protocol AvatarSelectionFlow {
    func start()
}

class AvatarSelectionCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let studentAvatarViewController = AvatarSelectionViewController()
        studentAvatarViewController.coordinator = self
        studentAvatarViewController.tabBarItem.image = UIImage(named: "AvatarTabBar.fill")
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentAvatarViewController, animated: true)
    }
}

extension AvatarSelectionCoordinator: AvatarSelectionFlow {
    

}
