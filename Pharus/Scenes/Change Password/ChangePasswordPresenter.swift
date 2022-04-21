//
//  ChangePasswordPresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import Foundation

protocol ChangePasswordPresenterProtocol {
    func isValidEmail(email: String) -> Bool
    func isValidPassword(password: String) -> Bool
    func changePasswordUser(email: String, password: String)
}

class ChangePasswordPresenter: ChangePasswordPresenterProtocol {
    
    //MARK: - Properties
    
   private var coordinator: ChangePasswordFlow
    
    //MARK: - Initializer
    
    init(coordinator: ChangePasswordFlow) {
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
    
    func changePasswordUser(email: String, password: String) {
        let student: Student = Bundle.main.decode("Student.json")
//        coordinator.showChangePassword(student: Student)
    }
}
