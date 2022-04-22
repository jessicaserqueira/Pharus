//
//  ProjectSubcriptionAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubcriptionAlertViewController: UIViewController {
    
    private var alertView: ProjectSubcriptionAlertView
    private var coordinator: ProjectSubcriptionAlertCoordinator
    private var presenter: ProjectSubcriptionAlertPresenter
    
    init(
        alertView: ProjectSubcriptionAlertView,
        coordinator: ProjectSubcriptionAlertCoordinator,
        presenter: ProjectSubcriptionAlertPresenter
    ) {

        self.alertView = alertView
        self.coordinator = coordinator
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.delegate = self
        self.view = alertView
        
    }
}

extension ProjectSubcriptionAlertViewController: ProjectSubcriptionAlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }
    
    func primaryButtonTapped() {
        presenter.subscribeToProject()
    }
    
    func secondaryButtonTapped() {
        presenter.closeModal()
    }
}


