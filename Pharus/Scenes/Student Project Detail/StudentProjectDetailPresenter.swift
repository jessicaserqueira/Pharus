//
//  StudentProjectDetailPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

protocol StudentProjectsDetailPresenterProtocol {
    func showProjectRules()
    func showUploadFileView()
    func toggleTaskCompletedStatus(task: TaskModel)
    func showMentorReview()
}

class StudentProjectDetailPresenter: StudentProjectsDetailPresenterProtocol {
    
    //MARK: - Properties
    
    private var coordinator: StudentProjectDetailCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: StudentProjectDetailCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Actions
    
    func showProjectRules() {
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
