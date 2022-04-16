//
//  LoginPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 28/03/22.
//

import Foundation

protocol LoginPresenterProtocol {
    func isValidEmail(email: String) -> Bool
    func isValidPassword(password: String) -> Bool
    func loginUser(email: String, password: String)
}

class LoginPresenter: LoginPresenterProtocol {
    
    var coordinator: LoginFlow?
    
    init(coordinator: LoginFlow) {
        self.coordinator = coordinator
    }
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = K.RegEx.emailRegEx
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = K.RegEx.passwordRegEx
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }
    
    func loginUser(email: String, password: String) {
        let student: Student = Bundle.main.decode("Student.json")
        coordinator?.showHome(student: student)
    }
}
