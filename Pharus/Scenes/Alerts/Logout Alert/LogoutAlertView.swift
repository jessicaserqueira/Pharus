//
//  LogoutAlertView.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol LogoutAlertViewDelegate: AnyObject {
    func primaryButtonTapped()
    func secondaryButtonTapped()
}

class LogoutAlertView: UIView {
    
    //MARK: - Properties
    weak var delegate: LogoutAlertViewDelegate?
    
    
    //MARK: - Views
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return blurEffectView
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.modal.yellowBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "LogoutAlertViewDelegate.mainView"
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LogoutAlertViewDelegate.mainStackView"
        
        return stackView
    }()
    
    private lazy var logoutIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "LogoutAlertViewDelegate.logoutIconHelperView"
        
        return view
    }()
    
    private lazy var logoutIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.logOutIcon?.withTintColor(.black)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "LogoutAlertViewDelegate.logoutIconImageView"
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Deseja sair da sua conta?"
        label.textAlignment = .center
        label.font = UIFont.mediumTitleBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LogoutAlertViewDelegate.titleLabel"
        
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 39
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LogoutAlertViewDelegate.buttonStackView"
        
        return stackView
    }()
    
    private lazy var primaryButton: SmallAlertButton = {
        let button = SmallAlertButton(
            title: "Sair",
            importance: .primary
        )
        button.addAction(UIAction { _ in
            self.primaryButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "LogoutAlertViewDelegate.yesButton"
        
        return button
    }()
    
    private lazy var secondaryButton: SmallAlertButton = {
        let button = SmallAlertButton(
            title: "Cancelar",
            importance: .secondary
        )
        button.addAction(UIAction { _ in
            self.secondaryButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "LogoutAlertViewDelegate.noButton"
        
        return button
    }()
    
    //MARK: - Initilizer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    private func configureSubviews() {
        addSubview(blurEffectView)
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(logoutIconHelperView)
        
        logoutIconHelperView.addSubview(logoutIconImageView)
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(primaryButton)
        buttonStackView.addArrangedSubview(secondaryButton)
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        //Main View
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 217)
        ])
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 26, left: 18, bottom: -16, right: -18)
        
        //Logout Icon Helper View
        NSLayoutConstraint.activate([
            logoutIconHelperView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Logout Icon Image View
        logoutIconImageView.center(in: logoutIconHelperView)
        NSLayoutConstraint.activate([
            logoutIconImageView.heightAnchor.constraint(equalToConstant: 48),
            logoutIconImageView.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    //MARK: - Actions
    
    func primaryButtonTapped() {
        delegate?.primaryButtonTapped()
    }
    
    func secondaryButtonTapped() {
        delegate?.secondaryButtonTapped()
    }
}

