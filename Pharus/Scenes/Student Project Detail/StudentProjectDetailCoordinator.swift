//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

protocol StudentProjectDetailFlow {
    func showProjectRules()
    func showSendFileView()
    func showMentorReview()
}

class StudentProjectDetailCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var project: ProjectModel
    
    init(navigationController: UINavigationController, project: ProjectModel) {
        self.navigationController = navigationController
        self.project = project
    }
    
    func start() {
        let studentProjectDetailPresenter = StudentProjectDetailPresenter(coordinator: self)
        
        let studentProjectDetailViewController = StudentProjectDetailViewController(
            coordinator: self,
            presenter: studentProjectDetailPresenter,
            project: project
        )
                
        navigationController.pushViewController(studentProjectDetailViewController, animated: true)
    }
}

extension StudentProjectDetailCoordinator: StudentProjectDetailFlow {

    func showProjectRules() {
        
        let projectSheetView = ProjectSheetView(
            viewTitle: "Atividades",
            descriptionTitle: "Tarefa 01",
            descriptionText: project.rules,
            icon: UIImage(named: K.Assets.Icons.rulesIcon)!
        )
        
        let projectSheetCoordinator = ProjectSheetCoordinator(
            navigationController: navigationController,
            projectSheetView: projectSheetView
        )
        
        coordinate(to: projectSheetCoordinator)
    }
    
    func showMentorReview() {
        let projectSheetView = ProjectSheetView(
            viewTitle: "Avaliação do mentor",
            descriptionTitle: "Tarefa 01:",
            descriptionText: project.scoreDescription ?? "",
            icon: UIImage.icons.feedbackIcon ?? .defaultImage
        )
        
        let projectSheetCoordinator = ProjectSheetCoordinator(
            navigationController: navigationController,
            projectSheetView: projectSheetView
        )
        
        coordinate(to: projectSheetCoordinator)
    }
    
    func showSendFileView() {
        let sendFileCoordinator = SendFileCoordinator(
            navigationController: navigationController,
            project: project
        )

        coordinate(to: sendFileCoordinator)
    }
}
