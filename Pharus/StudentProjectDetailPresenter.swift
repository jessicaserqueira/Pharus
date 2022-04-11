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
    func showTaskDescription(task: Task)
    func toggleTaskCompletedStatus(task: Task)
}

class StudentProjectDetailPresenter: StudentProjectsDetailPresenterProtocol {
    
    var coordinator: StudentProjectDetailCoordinator?
    
    func showProjectRules(rules: String) {
        print(rules)
    }
    
    func showUploadFileView() {
        print("upar arquivo")
    }
    
    func showTaskDescription(task: Task) {
        print(task.taskDescription)
    }
    
    func toggleTaskCompletedStatus(task: Task) {
        print(task.isComplete)
    }
}
