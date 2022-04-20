//
//  SendFileViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit
import UniformTypeIdentifiers

class SendFileViewController: UIViewController, UIDocumentPickerDelegate {
    
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
    func uploadButtonTapped() {
        presenter.uploadFile()
        let suportFiles: [UTType] = [UTType.data]
        let vc = UIDocumentPickerViewController(forOpeningContentTypes: suportFiles, asCopy: true)
        vc.delegate = self
        vc.allowsMultipleSelection = false
    
        present(vc, animated: true, completion: nil)
        
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt url: URL) {
        
        print("a file was selected")
        
    }
    
    func sendFileButtonTapped() {
        presenter.sendFile()
    }
}
extension SendFileViewController: AlertViewDelegate {
    func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
