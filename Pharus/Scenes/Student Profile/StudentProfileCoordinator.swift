//
//  StudentProfileCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

protocol StudentProfileFlow {
    
}

class StudentProfileCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var student: StudentModel
    
    //MARK: - Initializer
    
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

//MARK: - Actions

extension StudentProfileCoordinator: StudentProfileFlow {
    func showLogOutAlert() {
        let logoutAlertView = LogoutAlertView()
        
        let logoutAlertCoordinator = LogoutAlertCoordinator(
            navigationController: navigationController,
            alertView: logoutAlertView
        )
        
        coordinate(to: logoutAlertCoordinator)
    }
}
