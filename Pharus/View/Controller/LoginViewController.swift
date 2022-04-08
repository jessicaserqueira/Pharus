//
//  LoginViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var customView = LoginView()
    var coordinator: LoginCoordinator?
    var presenter: LoginPresenter?
    var student: Student?
        
    override func loadView() {
        super.loadView()
        
        self.view = customView
        customView.delegate = self
        student = Bundle.main.decode("Student.json")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeHideKeyboard()
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginButtonPressed() {
        presenter?.loginButtonPressed()
    }
    
    func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
    }
}


