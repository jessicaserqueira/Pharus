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
    
    var coordinator: StudentProjectDetailCoordinator?
    
    func showProjectRules(rules: String) {
        coordinator?.showProjectRules(rules: rules)
    }
    
    func showUploadFileView() {
        print("passou aq")
        coordinator?.showSendFileView()
    }
        
    func toggleTaskCompletedStatus(task: Task) {
        task.toggleCompletionStatus()
        print(task.isComplete)
    }
}
