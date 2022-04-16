//
//  ProjectRulesViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class ProjectSheetViewController: UIViewController {
    
    var coordinator: ProjectSheetCoordinator
    var presenter: ProjectSheetPresenter
    var projectSheetView: ProjectSheetView
    
    override func loadView() {
        super.loadView()
        
        self.view = projectSheetView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectSheetView.delegate = self
    }
    
    init(
        coordinator: ProjectSheetCoordinator,
        presenter: ProjectSheetPresenter,
        projectSheetView: ProjectSheetView
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.projectSheetView = projectSheetView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProjectSheetViewController: ProjectSheetDelegate {
    func closeButtonTapped() {
        presenter.popView()
    }
}
