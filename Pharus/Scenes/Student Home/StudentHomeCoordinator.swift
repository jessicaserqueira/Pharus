//
//  StudentHomeCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol StudentHomeFlow {
    
}

class StudentHomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var student: StudentModel
    
    init(
        navigationController: UINavigationController,
         student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }
    
    func start() {
        
        let studentHomePresenter = StudentHomePresenter(coordinator: self)
        let studentHomeViewController = StudentHomeViewController(
            coordinator: self,
            presenter: studentHomePresenter,
            student: student
        )
    
        navigationController.setNavigationBarHidden(true, animated: true)
        
        navigationController.pushViewController(studentHomeViewController, animated: true)
    }
}

extension StudentHomeCoordinator: StudentHomeFlow {

}

