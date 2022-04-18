//
//  StudentProjectsPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

protocol StudentProjectsPresenterProtocol {
    func showStudentProject(project: Project)
}

class StudentProjectsPresenter: StudentProjectsPresenterProtocol {
    private var coordinator: StudentProjectsCoordinator
    
    init(coordinator: StudentProjectsCoordinator) {
        self.coordinator = coordinator
    }
    
    func showStudentProject(project: Project) {
        coordinator.showStudentProject(project)
    }
}

