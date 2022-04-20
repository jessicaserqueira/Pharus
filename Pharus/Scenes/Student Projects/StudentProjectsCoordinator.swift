//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

protocol StudentProjectsFlow {
    func showStudentProject(_ project: Project)
}

class StudentProjectsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var student: Student
    
    init(navigationController: UINavigationController, student: Student) {
        self.navigationController = navigationController
        self.student = student
    }
    
    func start() {
        let studentProjectsPresenter = StudentProjectsPresenter(coordinator: self)
        
        let studentProjectsViewController = StudentProjectsViewController(
            coordinator: self,
            presenter: studentProjectsPresenter,
            student: student
        )

        navigationController.setNavigationBarHidden(false, animated: true)
        
        navigationController.pushViewController(studentProjectsViewController, animated: true)
    }
}

extension StudentProjectsCoordinator: StudentProjectsFlow {
    func showStudentProject(_ project: Project) {
        let studentProjectDetailCoordinator = StudentProjectDetailCoordinator(
            navigationController: navigationController,
            project: project
        )
        
        self.coordinate(to: studentProjectDetailCoordinator)
    }
    
    func showSubscribeAlert(of project: Project) {
        let alertView = TwoBigButtonsAlertView(
            title: "Confirmar Inscrição",
            message: "Você deseja se inscrever no projeto \"\(project.name)\"?",
            mainButtonText: "Sim, quero me inscrever",
            secondaryButtonText: "Não quero, mudei de idéia"
        )
        
        let twoBigButtonsAlertCoordinator = TwoBigButtonsAlertCoordinator(
            navigationController: navigationController,
            alertView: alertView
        )
        
        coordinate(to: twoBigButtonsAlertCoordinator)
    }
}

