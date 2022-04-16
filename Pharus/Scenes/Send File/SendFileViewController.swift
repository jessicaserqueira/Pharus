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
        
        let alertView = AlertView(
            message: "Arquivo enviado com sucesso!",
            image: .images.checkImage ?? .defaultImage
        )
        
        alertView.delegate = self
        
        let alertViewController = AlertViewController(alertView: alertView)
        alertViewController.modalPresentationStyle = .fullScreen
        
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
    func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
