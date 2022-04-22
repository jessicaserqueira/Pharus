//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginFlow {
    func showChangePassword (student: StudentModel)
    func showHome(student: StudentModel)

}

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginPresenter = LoginPresenter(coordinator: self)
        let loginViewController = LoginViewController(
            coordinator: self,
            presenter: loginPresenter
        )
    
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.tabBarController?.tabBar.isHidden = true
        navigationController.setViewControllers([loginViewController], animated: true)
    }
}
extension LoginCoordinator: LoginFlow {
    func showChangePassword(student: StudentModel) {
        let coordinator = ChangePasswordCoordinator(
            navigationController: navigationController,
            student
        )
          
        self.coordinate(to: coordinator)
    }
    func showHome(student: StudentModel) {
        let tabbarViewController = TabBarViewController()
        let tabbarCoordinator = TabBarCoordinator(
            navigationController: navigationController,
            tabBarViewController: tabbarViewController,
            student: student)
        
        coordinate(to: tabbarCoordinator)
    }
}
