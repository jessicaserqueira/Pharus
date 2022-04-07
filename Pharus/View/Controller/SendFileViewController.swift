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
        
        let alertView = AlertView()
        alertView.alertMessageLabel.text = "Arquivo enviado com sucesso!"
        
        alertView.actionButton.addAction(UIAction { _ in
            self.dismiss(animated: true)
        }, for: .touchUpInside)
        
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
