//
//  StudentProfileViewConttroller.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 14/04/22.
//

import UIKit

class StudentProfileViewController: UIViewController {
    var coordinator: StudentProfileFlow?
    
    // MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
//        let student: Student = Bundle.main.decode("Student.json")
//        print(student)
        //        viewCustom.backgroundColor = .cyan
        //        self.view = viewCustom
    }
}
