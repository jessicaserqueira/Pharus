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
    
    //MARK: - Actions
    
    private func setNavigationBar() {
        self.navigationController?.title = ""
        
        let logoutIcon = UIImage.icons.xmarkIcon?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: logoutIcon,
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
        presenter.changePasswordUser()
    }
    
    @objc func logoutTapped() {
        presenter.logoutChangePassword()
    }
}


