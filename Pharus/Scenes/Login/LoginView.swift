//
//  LoginView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject{
    func loginButtonPressed()
}

class LoginView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: LoginViewDelegate?
    
    //MARK: - Views
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "LoginView.mainView"
        
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.appLogoImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "LoginView.logoImageView"
        
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIScreen.main.bounds.height/17
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.mainStackView"
        
        return stackView
    }()
    
    private lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = UIColor.purple.pharusPurple
        label.font = .largeTitleBold
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.loginTitle"
        
        return label
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.emailStackView"
        
        return stackView
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = .mediumTitleBold
        label.textColor = UIColor.purple.pharusPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.emailLabel"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "antonia.ferreira@gmail.com",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.textColor = .black
        textField.font = .smallBody
        textField.layer.shadowColor = UIColor.purple.pharusPurple.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 0.30
        textField.layer.shadowRadius = 0.0
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "LoginView.emailTextField"
        
        return textField
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.passwordStackView"
        
        return stackView
    }()
    
    private  lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.font = .mediumTitleBold
        label.textColor = UIColor.purple.pharusPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.passwordLabel"
        
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Senha",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.textColor = .black
        textField.font = .smallBody
        textField.layer.shadowColor = UIColor.purple.pharusPurple.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 0.30
        textField.layer.shadowRadius = 0.0
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "LoginView.passwordTextField"
        
        return textField
    }()
    
  private lazy var wrongPasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.wrongPasswordStackView"
        
        return stackView
    }()
    
    lazy var wrongPasswordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.errorIcon?.withTintColor(.clear)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "LoginView.wrongPasswordImageView"
        
        return imageView
    }()
    
    lazy var wrongPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha incorreta!"
        label.font = .smallBody
        label.textColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.wrongPasswordLabel"
        
        return label
    }()
    
    private lazy var loginButton: MainCardButton = {
        let button = MainCardButton(title: "Entrar", buttonState: .normal)
        button.addAction(UIAction { _ in
            self.loginButtonPressed()
        }, for: .touchUpInside)
        button.titleLabel?.font = .largeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "LoginView.loginButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    func configureSubviews() {
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
        passwordStackView.addArrangedSubview(wrongPasswordStackView)
        
        wrongPasswordStackView.addArrangedSubview(wrongPasswordImageView)
        wrongPasswordStackView.addArrangedSubview(wrongPasswordLabel)
        
        mainStackView.addArrangedSubview(loginButton)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        //Main View
        self.stretch(mainView)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32)
        ])
        
        //Wrong password Image View
        NSLayoutConstraint.activate([
            wrongPasswordImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}

//MARK: - Actions

extension LoginView: LoginViewDelegate {
    func loginButtonPressed() {
        delegate?.loginButtonPressed()
    }
}
