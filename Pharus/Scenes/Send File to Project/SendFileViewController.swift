//
//  SendFileViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class SendFileViewController: UIViewController {

    let customView = SendFileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertViewController = AlertViewController()
        alertViewController.modalPresentationStyle = .fullScreen
        
        let alertView = AlertView(
            message: "Arquivo enviado com sucesso!",
                                  image: .alertIcon!
        )
        
        alertView.delegate = self
        
        alertViewController.alertView = alertView
        
        customView.sendFileButton.addAction(UIAction { _ in
            self.present(alertViewController, animated: true)
        }, for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()

        self.view = customView
    }
}

extension SendFileViewController: AlertViewDelegate {
    func mainButtonTapped() {
        self.dismiss(animated: true)
    }
}
