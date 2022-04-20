//
//  TwoBigButtonsAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class TwoBigButtonsAlertViewController: UIViewController {
    
    private var alertView: TwoBigButtonsAlertView
    private var coordinator: TwoBigButtonsAlertCoordinator
    private var presenter: TwoBigButtonsAlertPresenter
    
    init(
        alertView: TwoBigButtonsAlertView,
        coordinator: TwoBigButtonsAlertCoordinator,
        presenter: TwoBigButtonsAlertPresenter
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

extension TwoBigButtonsAlertViewController: TwoBigButtonsAlertViewDelegate {
    func closeButtonTapped() {
        presenter.closeModal()
    }
    
    func primaryButtonTapped() {
        print("primerio botao")
    }
    
    func secondaryButtonTapped() {
        print("segundo botao")
    }
}


