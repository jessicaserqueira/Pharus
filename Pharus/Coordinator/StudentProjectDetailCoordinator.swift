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
    var project: Project?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        let projectRulesViewController = ProjectRulesViewController()
        projectRulesViewController.rules = rules
        
        navigationController.pushViewController(projectRulesViewController, animated: true)
    }
    
    func showSendFileView() {
        let sendFileViewController = SendFileViewController()
        navigationController.present(sendFileViewController, animated: true)
    }
}
