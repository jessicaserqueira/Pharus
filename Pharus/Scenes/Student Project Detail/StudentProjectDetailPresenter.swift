//
//  StudentProjectDetailPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

protocol StudentProjectsDetailPresenterProtocol {
    func showProjectRules(rules: String)
    func showUploadFileView()
    func toggleTaskCompletedStatus(task: Task)
}

class StudentProjectDetailPresenter: StudentProjectsDetailPresenterProtocol {
    
    private var coordinator: StudentProjectDetailCoordinator
    
    init(coordinator: StudentProjectDetailCoordinator) {
        self.coordinator = coordinator
    }
    
    func showProjectRules(rules: String) {
        coordinator.showProjectRules()
    }
    
    func showUploadFileView() {
        coordinator.showSendFileView()
    }
    
    func toggleTaskCompletedStatus(task: Task) {
        task.toggleCompletionStatus()
        print(task.isComplete)
    }
}
