//
//  LoginFormValidatorTests.swift
//  LoginFormValidatorTests
//
//  Created by Victor Colen on 28/03/22.
//

import XCTest
@testable import Pharus

class LoginPresenterTests: XCTestCase {
    
    func testLoginPresenter_WhenEmailHasConsecutiveDots_ShoudlReturnFalse() {
        //Arrange
        let loginPresenter = LoginPresenter()
        
        //Act
        let email = "john@doe........com"
        let isValidEmail = loginPresenter.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailHasNoAts_shouldReturnFalse() {
        //Arrange
        let loginPresenter = LoginPresenter()
        
        //Act
        let email = "johndoe.com"
        let isValidEmail = loginPresenter.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailHasTwoAts_ShouldReturnFalse() {
        //Arrange
        let sut = LoginPresenter()
        
        //Act
        let email = "john@@doe.com"
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailIsSQLInjection_ShouldReturnFalse() {
        //Arrange
        let sut = LoginPresenter()
        
        //Act
        let email = "\"DELETE FROM USER\""
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailIsValid_ShouldReturnTrue() {
        //Arrange
        let sut = LoginPresenter()
        
        //Act
        let email = "john@doe.com.br"
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertTrue(isValidEmail, "Test should have returned true, but returned false instead")
    }
    
    func testLoginPresenter_WhenPasswordCountIsLessThanEight_ShouldReturnFalse() {
        //Arrange
        let sut = LoginPresenter()
        
        //Act
        let password = "!234567"
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertFalse(isValidPassword, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenPasswordIsValid_ShouldReturnTrue() {
        //Arrange
        let sut = LoginPresenter()
        
        //Act
        let password = "!234567Q"
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertTrue(isValidPassword, "Test should have returned true, but returned false instead")
    }
    
    func testLoginPresenter_WhenPasswordCountIsMoreThanEightButHasNoSpecialCharacters_ShouldReturnFalse() {
        //Arrange
        let sut = LoginPresenter()
        
        //Act
        let password = "12345678Z"
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertFalse(isValidPassword, "Test should have returned false, but returned false true instead")
    }
    
    func testLoginPresenter_WhenPasswordIsSQLInjection_ShouldReturnFalse() {
        //Arrange
        let sut = LoginPresenter()
        
        //Act
        let password = "\"DELETE FROM USER\""
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertFalse(isValidPassword, "Test should have returned false, but returned false true instead")
    }
}
