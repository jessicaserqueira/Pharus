//
//  AvatarSelectionCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

protocol AvatarSelectionFlow {
    func start()
}

class AvatarSelectionCoordinator: Coordinator {
    
    //MARK: - Properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var student: StudentModel
    
    //MARK: - Initializer
    
    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }
    
    func start() {
        let studentAvatarViewController = AvatarSelectionViewController(
            coordinator: self,
            student: student
        )
        
        navigationController.pushViewController(studentAvatarViewController, animated: true)
    }
}

extension AvatarSelectionCoordinator: AvatarSelectionFlow {
    
    
}
