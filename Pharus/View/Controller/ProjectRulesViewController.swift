//
//  ProjectRulesViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class ProjectRulesViewController: UIViewController {
    
    var coordinator: LoginCoordinator?
    var customView = ProjectRulesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = customView
        customView.closeButton.addAction(UIAction { _ in
            self.dismiss(animated: true)
        }, for: .touchUpInside)
    }
}
