//
//  SendFileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit
import UniformTypeIdentifiers

class SendFileViewController: UIViewController, UIDocumentPickerDelegate {
    
    //MARK: - Properties
    
    private let sendFileView = SendFileView()
    private let presenter: SendFilePresenter
    private let coordinator: SendFileCoordinator
    
    //MARK: - Initializer
    
    init(
        presenter: SendFilePresenter,
        coordinator: SendFileCoordinator
    ) {
        self.presenter = presenter
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        sendFileView.delegate = self
        self.view = sendFileView
    }
}

//MARK: - Send File Delegate

extension SendFileViewController: SendFileDelegate {
    func closeButtonTapped() {
        presenter.closeSheet()
    }
    
    func uploadButtonTapped() {
        let suportFiles: [UTType] = [
            .pdf,
            .data,
            .jpeg
        ]
        
        let controller = UIDocumentPickerViewController(
            forOpeningContentTypes: suportFiles,
            asCopy: true
        )
        
        controller.delegate = self
        controller.allowsMultipleSelection = false
        present(controller, animated: true, completion: nil)
    }
    
    func documentPicker(
        _ controller: UIDocumentPickerViewController,
        didPickDocumentsAt urls: [URL]
    ) {
        if let filename = urls.first?.lastPathComponent {
            sendFileView.fileNameLabel.text = filename
            sendFileView.sendFileButton.enable()
        }
    }
    
    func sendFileButtonTapped() {
        presenter.sendFile()
    }
}
