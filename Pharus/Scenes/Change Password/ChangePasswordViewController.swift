//
//  ChangePasswordViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    //MARK: - Properties
    
    private var customView = ChangePasswordView()
    private var coordinator: ChangePasswordFlow
    private var presenter: ChangePasswordPresenter
    
    //MARK: - Initializer
    
    init(
        coordinator: ChangePasswordFlow,
        presenter: ChangePasswordPresenter
    ) {
        self.presenter = presenter
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeHideKeyboard()
        setNavigationBar()
    }
    
    //MARK: - Actions
    
    private func setNavigationBar() {
        self.navigationController?.title = ""
        
        let closeViewIcon = UIImage.icons.xmarkIcon?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: closeViewIcon,
            style: .plain,
            target: self,
            action: #selector(logoutTapped)
        )
    }
    
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

//MARK: - Change Password Delegate
extension ChangePasswordViewController: ChangePasswordDelegate {
    func changePasswordButtonPressed() {
        guard let email = customView.emailTextField.text else { return }
        guard let newPassword = customView.newPasswordTextField.text else { return }
        guard let confirmingPassword = customView.confirmPasswordTextField.text else { return }
        
        presenter.changeStudentPassword(
            email: email,
            newPassword: newPassword,
            confirmingPassword: confirmingPassword
        )
    }
    
    @objc func logoutTapped() {
        presenter.logoutChangePassword()
    }
}


