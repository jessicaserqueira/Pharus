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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.mainStackView"
        return stackView
    }()

  
    
    lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.loginTitle"
       
        
        return label
    }()
    
    

    
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.emailStackView"

        
        return stackView
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.emailLabel"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email@email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "LoginView.emailTextField"
        
        return textField
    }()
        
    lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.passwordStackView"
        
        
        return stackView
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.passwordLabel"
       
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "LoginView.passwordTextField"
        
        return textField
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
        button.titleLabel?.font = .boldSystemFont(ofSize: 45)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
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
        emailStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
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
            logoImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 70)
           
        ])
                
        //Container Stack View
        NSLayoutConstraint.activate([
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22.78),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 50)
        ])
                
        //Login Title
        NSLayoutConstraint.activate([

            loginTitle.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50),
            loginTitle.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50),
            loginTitle.bottomAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 200)
           
        ])
        
        
        
        
        
        
    }
 
    
}
