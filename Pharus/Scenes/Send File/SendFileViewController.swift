//
//  SendFileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
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
        let suportFiles: [UTType] =
            [
                UTType.pdf,
                UTType.data,
                UTType.jpeg
            ]
        
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: suportFiles, asCopy: true)
        controller.delegate = self
        controller.allowsMultipleSelection = false
        present(controller, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let filename = urls.first?.lastPathComponent {
            print(filename)
            sendFileView.fileNameLabel.text = filename
        }
    }
    func sendFileButtonTapped() {
        presenter.sendFile()
    }
}

extension SendFileViewController: ConfirmationAlertViewDelegate {
    func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
