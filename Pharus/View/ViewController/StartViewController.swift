//
//  ViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 22/03/22.
//

import UIKit

class StartViewController: UIViewController {
    var coordinator: StartFlow?
  
       // MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
<<<<<<< HEAD
=======
    
    override func loadView() {
        super.loadView()
        
        let student: Student = Bundle.main.decode("Student.json")
        print(student)
        viewCustom.backgroundColor = .cyan
        self.view = viewCustom
    }

>>>>>>> develop

}
