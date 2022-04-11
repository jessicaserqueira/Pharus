//
//  StudentProjectsPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import Foundation

protocol StudentProjectsPresenterProtocol {
    func showStudentProject(project: Project)
}

class StudentProjectsPresenter: StudentProjectsPresenterProtocol {
    var coordinator: StudentProjectsCoordinator?
    
    func showStudentProject(project: Project) {
        coordinator?.showStudentProject(project)
    }
}

