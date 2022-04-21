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
    func toggleTaskCompletedStatus(task: TaskModel)
    func showMentorReview()
}

class StudentProjectDetailPresenter: StudentProjectsDetailPresenterProtocol {
    
    private var coordinator: StudentProjectDetailCoordinator
    
    init(coordinator: StudentProjectDetailCoordinator) {
        self.coordinator = coordinator
    }
    
    func showProjectRules(rules: String) {
        coordinator.showProjectRules()
    }
    
    func showMentorReview() {
        coordinator.showMentorReview()
    }
    
    func showUploadFileView() {
        coordinator.showSendFileView()
    }
    
    func toggleTaskCompletedStatus(task: TaskModel) {
        task.toggleCompletionStatus()
    }
}
