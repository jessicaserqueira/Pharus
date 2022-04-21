//
//  ChangePasswordCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import UIKit

protocol ChangePasswordFlow {
    func showChangePassword(student: Student)
}

class ChangePasswordCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var student: Student
    
    init(navigationController: UINavigationController, student: Student) {
        self.navigationController = navigationController
        self.student = student
    }
    
    func start() {
        let changePasswordPresenter = ChangePasswordPresenter(coordinator: self)
        let changePasswordViewController = ChangePasswordViewController(
            coordinator: self,
            presenter: changePasswordPresenter
        )
    
        navigationController.setNavigationBarHidden(true, animated: true)
        
        navigationController.pushViewController(changePasswordViewController, animated: true)
    }
}

extension ChangePasswordCoordinator: ChangePasswordFlow {
    func showChangePassword(student: Student){
        
    }
    
}
