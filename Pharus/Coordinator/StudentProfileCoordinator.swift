//
//  StudentProfileCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 14/04/22.
//

import UIKit

protocol StudentProfileFlow {
    func showStudentProfile(student: Student)
}

class StudentProfileCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let studentProfileViewController = StudentProfileViewController()
        studentProfileViewController.coordinator = self
        
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentProfileViewController, animated: true)
    }
}

extension StudentProfileCoordinator: StudentProfileFlow {
    func showStudentProfile(student: Student) {
    
    }
    
    

}
