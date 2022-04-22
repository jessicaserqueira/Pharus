//
//  StudentProjectsRankingCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

class StudentProjectsRankingCoordinator: Coordinator {
    
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
        let studentProjectsRankingViewController = StudentRankingProjectsViewController(
            coordinator: self,
            student: student
        )

        navigationController.pushViewController(
            studentProjectsRankingViewController,
            animated: true
        )
    }
}
