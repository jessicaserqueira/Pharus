//
//  ProjectSheetCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 15/04/22.
//

import UIKit

protocol ProjectSheetFlow {
    func popView()
}

class ProjectSheetCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var projectSheetView: ProjectSheetView
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        projectSheetView: ProjectSheetView
    ) {
        self.navigationController = navigationController
        self.projectSheetView = projectSheetView
    }
    
    func start() {
        
        let projectSheetPresenter = ProjectSheetPresenter(
            coordinator: self,
            projectSheetView: projectSheetView
        )
        
        let projectSheetViewController = ProjectSheetViewController(
            coordinator: self,
            presenter: projectSheetPresenter,
            projectSheetView: projectSheetView
        )
        
        navigationController.present(projectSheetViewController, animated: true)
    }
}

//MARK: - Actions

extension ProjectSheetCoordinator: ProjectSheetFlow {
    func popView() {
        navigationController.dismiss(animated: true)
    }
}
