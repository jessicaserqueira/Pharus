//
//  AppCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 22/03/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var navigationController: UINavigationController
    var navigationBarController: UINavigationBar
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.navigationBarController = UINavigationBar()
        
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let mainCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: mainCoordinator)
    }
}
