//
//  ConfirmationAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class ConfirmationAlertViewController: UIViewController {
    
    private var alertView: ConfirmationAlertView
    private var coordinator: OneButtonAlertCoordinator
    private var presenter: OneButtonAlertPresenter
    
    init(
        alertView: ConfirmationAlertView,
        coordinator: OneButtonAlertCoordinator,
        presenter: OneButtonAlertPresenter
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

extension ConfirmationAlertViewController: ConfirmationAlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }
}
