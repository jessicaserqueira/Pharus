//
//  LogoutAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class LogoutAlertViewController: UIViewController {
    
    //MARK: - Properties
    
    private var alertView: LogoutAlertView
    private var coordinator: LogoutAlertCoordinator
    private var presenter: LogoutAlertPresenter
    
    //MARK: - Initializer
    
    init(
        alertView: LogoutAlertView,
        coordinator: LogoutAlertCoordinator,
        presenter: LogoutAlertPresenter
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

//MARK: - Logout Alert View Delegate

extension LogoutAlertViewController: LogoutAlertViewDelegate {
    
    func primaryButtonTapped() {
        presenter.logout()
    }
    
    func secondaryButtonTapped() {
        presenter.closeModal()
    }
}


