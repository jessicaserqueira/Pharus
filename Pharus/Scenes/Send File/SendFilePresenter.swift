//
//  SendFilePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

protocol SendFilePresenterProtocol {
   func sendFile()
}

class SendFilePresenter: SendFilePresenterProtocol {
    
    var coordinator: SendFileCoordinator
    
    init(coordinator: SendFileCoordinator) {
        self.coordinator = coordinator
    }
    
    func sendFile() {
        coordinator.showFileSentAlert()
    }
}

