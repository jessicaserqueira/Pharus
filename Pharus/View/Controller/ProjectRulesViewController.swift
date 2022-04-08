//
//  ProjectRulesViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class ProjectRulesViewController: UIViewController {
    
    var project: Project? = nil
    var coordinator: LoginCoordinator?
    var customView = ProjectRulesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.closeButton.addAction(UIAction { _ in
            self.dismiss(animated: true)
        }, for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
        if let project = project {
            customView.rulesLabel.text = project.rules
        }
    }
}
