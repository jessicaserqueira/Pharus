//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

protocol StudentProjectsFlow {
    func showStudentProject(_ project: ProjectModel)
}

class StudentProjectsCoordinator: Coordinator {
    
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

//MARK: - Actions

extension StudentProjectsCoordinator: StudentProjectsFlow {
    func showStudentProject(_ project: ProjectModel) {
        let studentProjectDetailCoordinator = StudentProjectDetailCoordinator(
            navigationController: navigationController,
            project: project
        )
        
        self.coordinate(to: studentProjectDetailCoordinator)
    }
    
    func showSubscribeAlert(of project: ProjectModel) {
        let alertView = ProjectSubcriptionAlertView(
            title: "Confirmar Inscrição",
            message: "Você deseja se inscrever no projeto \"\(project.name)\"?",
            mainButtonText: "Sim, quero me inscrever",
            secondaryButtonText: "Não quero, mudei de idéia"
        )
        
        let twoBigButtonsAlertCoordinator = ProjectSubcriptionAlertCoordinator(
            navigationController: navigationController,
            alertView: alertView,
            project: project
        )
        
        coordinate(to: twoBigButtonsAlertCoordinator)
    }
}

