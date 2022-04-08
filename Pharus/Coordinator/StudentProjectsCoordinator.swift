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

class StudentProjectsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var student: Student?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let studentProjectsViewController = StudentProjectsViewController()
        studentProjectsViewController.coordinator = self
        studentProjectsViewController.student = self.student
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentProjectsViewController, animated: true)
    }
}

extension StudentProjectsCoordinator: UserProjectsFlow {
    
    func showUserProjects() {
       
        
    }
}

