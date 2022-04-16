//
//  AlerViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//
import UIKit

class AlertViewController: UIViewController {
    
    private var alertView: AlertView
    private var coordinator: AlertCoordinator
    private var presenter: AlertPresenter
    
    init(
        alertView: AlertView,
        coordinator: AlertCoordinator,
        presenter: AlertPresenter
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

extension AlertViewController: AlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }
}
