//
//  UserProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class UserProjectsViewController: UIViewController {
    
    var coordinator: StartFlow?
  
       // MARK: - Properties
       
    let viewCustom = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func loadView() {
        super.loadView()
        
        let student: Student = Bundle.main.decode("Student.json")
        print(student)
        viewCustom.backgroundColor = .red
        self.view = viewCustom
    }

    
}
