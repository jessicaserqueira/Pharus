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
    
    //MARK: - Properties
    
    var coordinator: ProjectSheetCoordinator
    private var projectSheetView: ProjectSheetView
    
    //MARK: - Initializer
    
    init(
        coordinator: ProjectSheetCoordinator,
        projectSheetView: ProjectSheetView
    ) {
        self.coordinator = coordinator
        self.projectSheetView = projectSheetView
    }
}

//MARK: - Actions

extension ProjectSheetPresenter: ProjectSheetProtocol {
    func popView() {
        coordinator.popView()
    }
}

