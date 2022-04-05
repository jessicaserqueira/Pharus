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
    var presenter: LoginPresenterProtocol?
    var student: Student?
    
    // MARK: - Properties
    
    override func loadView() {
        super.loadView()
        
        self.view = viewCustom
        viewCustom.delegate = self
        student = Bundle.main.decode("Student.json")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initializeHideKeyboard()
        
    }
}
extension LoginViewController: LoginViewDelegate {
    func loginButtonPressed() {
        //       presenter?.loginButtonPressed()
        coordinator?.showHome()
        
    }
    func initializeHideKeyboard(){
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        
        view.endEditing(true)
    }
}


