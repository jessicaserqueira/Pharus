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
       
    let viewCustom = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func loadView() {
        super.loadView()
        
        viewCustom.backgroundColor = .cyan
        self.view = viewCustom
    }


}
