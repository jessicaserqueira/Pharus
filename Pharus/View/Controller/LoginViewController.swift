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
        
    override func loadView() {
        super.loadView()
        
        self.view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeHideKeyboard()
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

extension LoginViewController: LoginViewDelegate {
    func loginButtonPressed() {
        guard let email = customView.emailTextField.text else { return }
        guard let password = customView.passwordTextField.text else { return }
        
        presenter?.loginUser(email: email, password: password)
    }
}


