//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

protocol StudentProjectDetailFlow {
    func start()
}

class StudentProjectDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var project: Project?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let studentProjectDetailPresenter = StudentProjectDetailPresenter()
        studentProjectDetailPresenter.coordinator = self
        
        let studentProjectDetailViewController = StudentProjectDetailViewController()
        studentProjectDetailViewController.project = self.project
        
        navigationController.pushViewController(studentProjectDetailViewController, animated: true)
    }
}

extension StudentProjectDetailCoordinator: StudentProjectDetailFlow {

}


