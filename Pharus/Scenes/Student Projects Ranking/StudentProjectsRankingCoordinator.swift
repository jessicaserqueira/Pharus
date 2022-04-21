//
//  StudentProjectsRankingCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

protocol StudentProjectsRankingFlow {
    func start()
}

class StudentProjectsRankingCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var student: StudentModel
    
    init(navigationController: UINavigationController, student: StudentModel) {
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

extension StudentProjectsRankingCoordinator: StudentProjectsRankingFlow {
    
    func showUserProjectsRanking() {
       
        
    }
}
