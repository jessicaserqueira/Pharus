//
//  StudentHomePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import Foundation

protocol StudentHomePresenterProtocol {

}

class StudentHomePresenter: StudentHomePresenterProtocol {
    
    //MARK: - Properties
    
   private var coordinator: StudentHomeCoordinator
    
    //MARK: - Initializer
    
    init(coordinator: StudentHomeCoordinator) {
        self.coordinator = coordinator
    }
}

