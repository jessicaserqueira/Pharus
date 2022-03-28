//
//  LoginViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var coordinator: LoginFlow?
    private lazy var viewCustom = LoginView()
    
    
    // MARK: - Properties
    
    override func loadView() {
        super.loadView()
        
        self.view = viewCustom
        viewCustom.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
}
extension LoginViewController: LoginViewDelegate {
    
}
