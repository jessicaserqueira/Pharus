//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

protocol StudentProjectDetailFlow {
    func showProjectRules(rules: String)
    func showSendFileView()
}

class StudentProjectDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var project: Project
    
    init(navigationController: UINavigationController, project: Project) {
        self.navigationController = navigationController
        self.project = project
    }
    
    func start() {
        let studentProjectDetailPresenter = StudentProjectDetailPresenter()
        studentProjectDetailPresenter.coordinator = self
        
        let studentProjectDetailViewController = StudentProjectDetailViewController()
        studentProjectDetailViewController.presenter = studentProjectDetailPresenter
        studentProjectDetailViewController.project = self.project
        
        navigationController.pushViewController(studentProjectDetailViewController, animated: true)
    }
}

extension StudentProjectDetailCoordinator: StudentProjectDetailFlow {
    
    func showProjectRules(rules: String) {
        
        let projectSheetView = ProjectSheetView(
            viewTitle: "Atividades",
            descriptionTitle: "Tarefa 01",
            descriptionText: project.rules,
            mainButtonTitle: "Fechar"
        )
        
        let projectSheetCoordinator = ProjectSheetCoordinator(
            navigationController: navigationController,
            projectSheetView: projectSheetView
        )
        
        coordinate(to: projectSheetCoordinator)
    }
    
    func showSendFileView() {
        let sendFileViewController = SendFileViewController()
        navigationController.present(sendFileViewController, animated: true)
    }
}
