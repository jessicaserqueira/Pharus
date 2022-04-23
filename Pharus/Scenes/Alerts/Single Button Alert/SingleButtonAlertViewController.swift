//
//  SingleButtonAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class SingleButtonAlertViewController: UIViewController {
    
    //MARK: - Properties
    
    private var alertView: SingleButtonAlertView
    private var coordinator: SingleButtonAlertCoordinator
    private var presenter: SingleButtonAlertPresenter
    
    //MARK: - Initializer
    
    init(
        alertView: SingleButtonAlertView,
        coordinator: SingleButtonAlertCoordinator,
        presenter: SingleButtonAlertPresenter
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

extension SingleButtonAlertViewController: SingleButtonAlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }
}
