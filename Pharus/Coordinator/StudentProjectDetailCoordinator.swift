//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

protocol StudentProjectDetailFlow {
    func start()
}

class StudentProjectDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let studentProjectDetailViewController = StudentProjectDetailViewController()
        studentProjectDetailViewController.coordinator = self
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentProjectDetailViewController, animated: true)
    }
}

extension StudentProjectDetailCoordinator: StudentProjectDetailFlow {
    
    func showStudentProjectDetail() {
       
        
    }
}
