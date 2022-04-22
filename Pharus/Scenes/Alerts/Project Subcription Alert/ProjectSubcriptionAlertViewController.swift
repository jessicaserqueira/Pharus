//
//  ProjectSubcriptionAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubcriptionAlertViewController: UIViewController {
    
    //MARK: - Properties
    
    private var alertView: ProjectSubcriptionAlertView
    private var coordinator: ProjectSubcriptionAlertCoordinator
    private var presenter: ProjectSubcriptionAlertPresenter
    
    //MARK: - Initializer
    
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
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.delegate = self
        self.view = alertView
        
    }
}

//MARK: - Project Subcription Alert View Delegate

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


