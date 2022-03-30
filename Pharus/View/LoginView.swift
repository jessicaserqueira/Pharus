//
//  LoginView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject{
        
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "LoginView.mainView"
        
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Pharus")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.center = self.mainView.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "LoginView.logoImageView"
        
        return imageView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIScreen.main.bounds.height/17
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.mainStackView"
        return stackView
    }()

  
    
    lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.loginTitle"
       
        
        return label
    }()
    
    
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.emailStackView"

        
        return stackView
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.emailLabel"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "antonia.ferreira@gmail.com"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "LoginView.emailTextField"
        
        return textField
    }()
        
    lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.passwordStackView"
        
        
        return stackView
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.passwordLabel"
       
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "LoginView.passwordTextField"
        
        return textField
    }()
    
    lazy var changePasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Esqueci minha senha!"
        label.font = .systemFont(ofSize: 9)
        label.textColor = .gray
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.changePasswordLabel"
       
        return label
    }()
    
    lazy var loginButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "LoginView.loginButtonView"
        
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "LoginView.loginButton"
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        backgroundColor = .white
        addSubview(mainView)
        mainView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(logoImageView)
        mainStackView.addArrangedSubview(loginTitle)
        mainStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(changePasswordLabel)
        mainStackView.addArrangedSubview(loginButtonView)
        loginButtonView.addSubview(loginButton)
                
    }
        
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView)
        backgroundColor = .white
        
        //Logo Image View
        NSLayoutConstraint.activate([

            logoImageView.widthAnchor.constraint(equalToConstant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            logoImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -50),
            logoImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 50),
            logoImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 100)
                      
        ])
                
        //Main Stack View
        NSLayoutConstraint.activate([
           
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
          
        ])
                
        //Login Title
        NSLayoutConstraint.activate([

            loginTitle.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            loginTitle.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            loginTitle.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 250)
           
        ])
        
        //E-mail Stack View
        NSLayoutConstraint.activate([
            emailStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            emailStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24)
          
        ])
        
        //E-mail Label
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor)
   
        ])
        
        //E-mail TextField
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor)
            
        ])
                
        //Password Stack View
        NSLayoutConstraint.activate([
            passwordStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            passwordStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24)
        ])
        
        //Password Label
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor)
        ])
        
        //Password TextField
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor)
        ])
        
        //Change Password Label
        NSLayoutConstraint.activate([
            changePasswordLabel.trailingAnchor.constraint(equalTo: passwordStackView.trailingAnchor)
        ])
        
        //Login Button
        NSLayoutConstraint.activate([
            
            loginButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 100)
        ])
        
    }
}
