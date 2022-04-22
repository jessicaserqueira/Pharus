//
//  LoginViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var customView = LoginView()
    private var coordinator: LoginCoordinator
    private var presenter: LoginPresenter
    var keyboardHeight = CGFloat(0)
    
    init(
        coordinator: LoginCoordinator,
        presenter: LoginPresenter
    ) {
        self.presenter = presenter
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
        
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
        customView.delegate = self
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeHideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.customView.frame.origin.y == 0 {
                self.customView.frame.origin.y -= keyboardSize.height + 50
                self.customView.frame.origin.y += keyboardSize.height - 130
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.customView.frame.origin.y != 0 {
            self.customView.frame.origin.y = 0
        }
    }
    
    func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(
                dismissMyKeyboard
                )
        )
        
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
        
        presenter.loginUser(email: email, password: password)
    }
    func changePasswordButtonTapped() {
        guard let email = customView.emailTextField.text else { return }
        presenter.showChangePassword(email: email)
    }
}


