//
//  SendFileViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class SendFileViewController: UIViewController {
    
    let sendFileView = SendFileView()
    let presenter: SendFilePresenter
    let coordinator: SendFileCoordinator
    
    init(presenter: SendFilePresenter, coordinator: SendFileCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func loadView() {
        super.loadView()
        
        sendFileView.delegate = self
        self.view = sendFileView
    }
}

extension SendFileViewController: SendFileDelegate {
    func sendFileButtonTapped() {
        presenter.sendFile()
    }
}

extension SendFileViewController: AlertViewDelegate {
    func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
