//
//  ChangePasswordView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 21/04/22.
//

import UIKit

protocol ChangePasswordDelegate: AnyObject{
    func changePasswordButtonPressed()
}

class ChangePasswordView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ChangePasswordDelegate?
    
    //MARK: - Views
    
    lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentProfileView.mainScrollView"
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ChangePasswordView.mainView"
        
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.appLogoImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "ChangePasswordView.logoImageView"
        
        return imageView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIScreen.main.bounds.height/17
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ChangePasswordView.mainStackView"
        
        return stackView
    }()
    
    lazy var changePasswordTitle: UILabel = {
        let label = UILabel()
        label.text = "Esqueci a senha!"
        label.textColor = UIColor.purple.pharusPurple
        label.font = .largeTitleBold
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ChangePasswordView.changePasswordTitle"
        
        return label
    }()
    
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ChangePasswordView.emailStackView"
        
        return stackView
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = .mediumTitleBold
        label.textColor = UIColor.purple.pharusPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ChangePasswordView.emailLabel"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "antonia.ferreira@gmail.com"
        textField.font = .smallBody
        textField.layer.shadowColor = UIColor.purple.pharusPurple.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 0.30
        textField.layer.shadowRadius = 0.0
        textField.backgroundColor = UIColor.white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "ChangePasswordView.emailTextField"
        
        return textField
    }()
    
    lazy var newPasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ChangePasswordView.newPasswordStackView"
    
        return stackView
    }()
    
    lazy var newPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Nova senha"
        label.font = .mediumTitleBold
        label.textColor = UIColor.purple.pharusPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ChangePasswordView.newPasswordLabel"
        
        return label
    }()
    
    lazy var newPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nova senha"
        textField.font = .smallBody
        textField.layer.shadowColor = UIColor.purple.pharusPurple.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 0.30
        textField.layer.shadowRadius = 0.0
        textField.backgroundColor = UIColor.white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "ChangePasswordView.newPasswordTextField"
        
        return textField
    }()
    
    lazy var confirmPasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ChangePasswordView.confirmPasswordStackView"
    
        return stackView
    }()
    
    lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirmar senha"
        label.font = .mediumTitleBold
        label.textColor = UIColor.purple.pharusPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ChangePasswordView.confirmPasswordLabel"
        
        return label
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirmar senha"
        textField.font = .smallBody
        textField.layer.shadowColor = UIColor.purple.pharusPurple.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 0.30
        textField.layer.shadowRadius = 0.0
        textField.backgroundColor = UIColor.white
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "ChangePasswordView.confirmPasswordTextField"
        
        return textField
    }()
    
    lazy var changePasswordButton: MainCardButton = {
        let button = MainCardButton(title: "Mudar senha", buttonState: .normal)
        button.addAction(UIAction { _ in
            self.changePasswordButtonPressed()
        }, for: .touchUpInside)
        button.titleLabel?.font = .largeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ChangePasswordView.changePasswordButton"

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
    
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(mainScrollView)
                
        mainScrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(logoImageView)
        mainStackView.addArrangedSubview(changePasswordTitle)
        mainStackView.addArrangedSubview(emailStackView)
        
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        
        mainStackView.addArrangedSubview(newPasswordStackView)
        
        newPasswordStackView.addArrangedSubview(newPasswordLabel)
        newPasswordStackView.addArrangedSubview(newPasswordTextField)
        
        mainStackView.addArrangedSubview(confirmPasswordStackView)
        confirmPasswordStackView.addArrangedSubview(confirmPasswordLabel)
        confirmPasswordStackView.addArrangedSubview(confirmPasswordTextField)
      
        
        mainStackView.addArrangedSubview(changePasswordButton)
    }
    
    func setupConstraints() {
      
        self.stretch(mainScrollView)
          
        //Main Stack View
        self.stretch(mainView, to: mainScrollView)
        mainView.center(in: mainScrollView)
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

        ])

                
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 32),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -32),
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 32),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -32)
        ])
    }
}

//MARK: - Actions

extension ChangePasswordView {
    func changePasswordButtonPressed() {
        delegate?.changePasswordButtonPressed()
    }
}

