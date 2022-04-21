//
//  ChangePasswordViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    private var customView = ChangePasswordView()
    private var coordinator: ChangePasswordFlow
    private var presenter: ChangePasswordPresenter
    
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
    
    func setNavigationBar() {
        self.navigationController?.title = ""
        
        let logoutIcon = UIImage.icons.xmarkIcon?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: logoutIcon,
            style: .plain,
            target: self,
            action: #selector(logoutTapped)
        )
    }
}

extension ChangePasswordViewController: ChangePasswordDelegate {
  func changePasswordButtonPressed() {
      
        presenter.changePasswordUser()
    }
    @objc func logoutTapped() {
        presenter.logoutChangePassword()
        
    }
}


