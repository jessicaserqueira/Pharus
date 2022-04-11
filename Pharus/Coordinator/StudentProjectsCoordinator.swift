//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

protocol UserProjectsFlow {
    func start()
    func showUserProject(project: Project)
}

class StudentProjectsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var student: Student?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let studentProjectsPresenter = StudentProjectsPresenter()
        studentProjectsPresenter.coordinator = self
        
        let studentProjectsViewController = StudentProjectsViewController()
        studentProjectsViewController.presenter = studentProjectsPresenter
        studentProjectsViewController.student = self.student
        
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentProjectsViewController, animated: true)
    }
}

extension StudentProjectsCoordinator: UserProjectsFlow {
    func showUserProject(project: Project) {
        let studentProjectDetailCoordinator = StudentProjectDetailCoordinator(navigationController: navigationController)
        studentProjectDetailCoordinator.project = project
        
        self.coordinate(to: studentProjectDetailCoordinator)
        
    }
}

