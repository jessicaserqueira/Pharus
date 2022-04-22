//
//  SendFilePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol SendFilePresenterProtocol {
    func uploadFile()
    func sendFile()
}

class SendFilePresenter {
    
    //MARK: - Properties
    
    var coordinator: SendFileCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: SendFileCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Actions

    func sendFile() {
        coordinator.showFileSentAlert()
    }
}

