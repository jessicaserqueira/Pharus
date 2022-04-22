//
//  ChangePasswordPresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import Foundation

protocol ChangePasswordPresenterProtocol {
    func isValidEmail(email: String) -> Bool
    func changePasswordUser()
    func logoutChangePassword()
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
    
    func changePasswordUser() {

        coordinator.showChangePassword()
    
    }
    func logoutChangePassword() {
        coordinator.showLogoutChangePassword()
    }
    
}
