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
    
    var coordinator: SendFileCoordinator
    
    init(coordinator: SendFileCoordinator) {
        self.coordinator = coordinator
    }
    func uploadFile(){
        
    }
    
    func sendFile() {
        coordinator.showFileSentAlert()
    }
}

