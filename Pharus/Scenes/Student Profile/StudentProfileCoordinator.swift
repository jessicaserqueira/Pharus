//
//  StudentProfileCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

protocol StudentProfileFlow {
    func showStudentProfile()
    
}

class StudentProfileCoordinator: Coordinator {
    
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
        let studentProfilePresenter = StudentProfilePresenter(
            coordinator: self
        )
        
        let studentProfileViewController = StutentProfileViewController(
            coordinator: self,
            presenter: studentProfilePresenter,
            student: student
        )

        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentProfileViewController, animated: true)
    }
}

extension StudentProfileCoordinator: StudentProfileFlow {
    func showStudentProfile() {
   
    }
    
    func showLogOutAlert() {
        let logoutAlertView = LogoutAlertView()
        
        let logoutAlertCoordinator = LogoutAlertCoordinator(
            navigationController: navigationController,
            alertView: logoutAlertView
        )
        
        coordinate(to: logoutAlertCoordinator)
    }
}
