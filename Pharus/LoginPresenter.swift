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
    func loginButtonPressed()
}

class LoginPresenter: LoginPresenterProtocol {
    
    var coordinator: LoginCoordinator?
    
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
    
    func loginButtonPressed() {
        coordinator?.showHome()
    }
}
