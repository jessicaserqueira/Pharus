//
//  StudentProjectsPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

protocol StudentProjectsPresenterProtocol {
    func showStudentProject(project: ProjectModel)
}

class StudentProjectsPresenter: StudentProjectsPresenterProtocol {
    private var coordinator: StudentProjectsCoordinator
    
    init(coordinator: StudentProjectsCoordinator) {
        self.coordinator = coordinator
    }
    
    func showStudentProject(project: ProjectModel) {
        coordinator.showStudentProject(project)
    }
    
    func showSubscribeAlert(of project: ProjectModel) {
        coordinator.showSubscribeAlert(of: project)
    }
}

