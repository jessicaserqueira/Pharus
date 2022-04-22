//
//  ChangePasswordPresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import Foundation

protocol ChangePasswordPresenterProtocol {
    func changeStudentPassword(email: String, newPassword: String, confirmingPassword: String)
    func logoutChangePassword()
}

class ChangePasswordPresenter: ChangePasswordPresenterProtocol {
    
    //MARK: - Properties
    
    private var coordinator: ChangePasswordFlow
    private var student: StudentModel
    
    //MARK: - Initializer
    
    init(
        coordinator: ChangePasswordFlow,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }
    
    //MARK: - Actions
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = K.RegEx.passwordRegEx
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }
    
    func changeStudentPassword(
        email: String,
        newPassword: String,
        confirmingPassword: String
    ) {
        if email == student.email &&
            self.isValidPassword(password: newPassword) &&
            confirmingPassword == newPassword {
            coordinator.showConfirmationAlert()
        } else {
            print("algo não está certo")
        }
    }
    
    func logoutChangePassword() {
        coordinator.closeChangePasswordView()
    }
    
}
