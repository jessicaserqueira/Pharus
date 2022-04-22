//
//  ConfirmationAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class ConfirmationAlertViewController: UIViewController {
    
    //MARK: - Properties
    
    private var alertView: ConfirmationAlertView
    private var coordinator: ConfirmationAlertCoordinator
    private var presenter: ConfirmationAlertPresenter
    
    //MARK: - Initializer
    
    init(
        alertView: ConfirmationAlertView,
        coordinator: ConfirmationAlertCoordinator,
        presenter: ConfirmationAlertPresenter
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

//MARK: - Confirmation Alert View Delegate

extension ConfirmationAlertViewController: ConfirmationAlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }
}
