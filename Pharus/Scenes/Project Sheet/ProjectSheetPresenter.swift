//
//  ProjectSheetPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 15/04/22.
//

import UIKit

protocol ProjectSheetProtocol {
    func popView()
}

class ProjectSheetPresenter {
    
    var coordinator: ProjectSheetCoordinator
    var projectSheetView: ProjectSheetView
    
    init(coordinator: ProjectSheetCoordinator, projectSheetView: ProjectSheetView) {
        self.coordinator = coordinator
        self.projectSheetView = projectSheetView
    }
}

extension ProjectSheetPresenter: ProjectSheetProtocol {
    func popView() {
        coordinator.popView()
    }
}

