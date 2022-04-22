//
//  LoginViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private var customView = LoginView()
    private var coordinator: LoginCoordinator
    private var presenter: LoginPresenter
    
    //MARK: - Initializer
    
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
    
    //MARK: - Life Cycle
    
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
    }
    
    //MARK: - Actions
    
    private func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(
                dismissMyKeyboard
            )
        )
        
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissMyKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - Login View Delegate

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


