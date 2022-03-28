//
//  LoginFormValidatorTests.swift
//  LoginFormValidatorTests
//
//  Created by Victor Colen on 28/03/22.
//

import XCTest
@testable import Pharus

class LoginPresenterTests: XCTestCase {
    
    var sut: LoginPresenter!
    
     override func setUp() {
        sut = LoginPresenter()
    }
    
     override func tearDown() {
        sut = nil
    }
    
    func testLoginPresenter_WhenEmailHasConsecutiveDots_ShoudlReturnFalse() {
        
        //Act
        let email = "john@doe........com"
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailHasNoAts_shouldReturnFalse() {
        
        //Act
        let email = "johndoe.com"
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailHasTwoAts_ShouldReturnFalse() {
        
        //Act
        let email = "john@@doe.com"
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailIsSQLInjection_ShouldReturnFalse() {

        //Act
        let email = "\"DELETE FROM USER\""
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertFalse(isValidEmail, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenEmailIsValid_ShouldReturnTrue() {

        //Act
        let email = "john@doe.com.br"
        let isValidEmail = sut.isValidEmail(email: email)
        
        //Assert
        XCTAssertTrue(isValidEmail, "Test should have returned true, but returned false instead")
    }
    
    func testLoginPresenter_WhenPasswordCountIsLessThanEight_ShouldReturnFalse() {

        //Act
        let password = "!234567"
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertFalse(isValidPassword, "Test should have returned false, but returned true instead")
    }
    
    func testLoginPresenter_WhenPasswordIsValid_ShouldReturnTrue() {

        //Act
        let password = "!234567Q"
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertTrue(isValidPassword, "Test should have returned true, but returned false instead")
    }
    
    func testLoginPresenter_WhenPasswordCountIsMoreThanEightButHasNoSpecialCharacters_ShouldReturnFalse() {

        //Act
        let password = "12345678Z"
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertFalse(isValidPassword, "Test should have returned false, but returned false true instead")
    }
    
    func testLoginPresenter_WhenPasswordIsSQLInjection_ShouldReturnFalse() {

        //Act
        let password = "\"DELETE FROM USER\""
        let isValidPassword = sut.isValidPassword(password: password)
        
        //Assert
        XCTAssertFalse(isValidPassword, "Test should have returned false, but returned false true instead")
    }
}
