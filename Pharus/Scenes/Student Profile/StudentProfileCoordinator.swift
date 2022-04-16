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
    var student: Student
    var studentProfileView: StudentProfileView
    
    init(navigationController: UINavigationController, student: Student, studentProfileView: StudentProfileView) {
        self.navigationController = navigationController
        self.student = student
        self.studentProfileView = studentProfileView
    }
    
    func start() {
        let studentProfilePresenter = StudentProfilePresenter(
            coordinator: self,
            studentProfileView: studentProfileView
        )
        
        let studentProfileViewController = StutentProfileViewController(
            coordinator: self,
            studentProfileView: studentProfileView, presenter: studentProfilePresenter
        )

        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentProfileViewController, animated: true)
    }
}

extension StudentProfileCoordinator: StudentProfileFlow {
    func showStudentProfile() {
   
    }
}
