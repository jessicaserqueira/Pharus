//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit

class StudentProjectDetailViewController: UIViewController {
    
    var coordinator: LoginCoordinator?
    var customView = StudentProjectDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = customView
    }
}
