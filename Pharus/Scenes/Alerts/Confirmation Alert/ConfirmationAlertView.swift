//
//  ConfirmationAlertView.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

protocol ConfirmationAlertViewDelegate: AnyObject {
    func closeButtonTapped()
}

class ConfirmationAlertView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ConfirmationAlertViewDelegate?
    private var message: String
    
    //MARK: - Views
    
    lazy var blurEffectView: UIVisualEffectView = {
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
        view.accessibilityIdentifier = "ConfirmationAlertView.mainView"
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ConfirmationAlertView.mainStackView"
        
        return stackView
    }()
    
    private lazy var alertIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ConfirmationAlertView.alertIconHelperView"
        
        return view
    }()
    
    private lazy var alertIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.checkIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "ConfirmationAlertView.alertIconImageView"
        
        return imageView
    }()
    
    private lazy var alertMessageHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ConfirmationAlertView.alertMessageHelperView"
        
        return view
    }()
    
    private lazy var alertMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .mediumTitleBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ConfirmationAlertView.alertMessageLabel"
        
        return label
    }()
    
    private lazy var actionButton: MainCardButton = {
        let button = MainCardButton()
        button.setTitle("Fechar", for: .normal)
        button.addAction(UIAction { _ in
            self.closeButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ConfirmationAlertView.actionButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    convenience init(message: String) {
        self.init()
        
        self.message = message
        
        configureSubviews()
        customizeView()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.message = "Alerta"
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(blurEffectView)
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(alertIconHelperView)
        
        alertIconHelperView.addSubview(alertIconImageView)
        
        mainStackView.addArrangedSubview(alertMessageHelperView)
        
        alertMessageHelperView.addSubview(alertMessageLabel)
        
        mainStackView.addArrangedSubview(actionButton)
    }
    
    private func customizeView() {
        alertMessageLabel.text = message
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
        self.stretch(mainStackView, to: mainView, top: 24, left: 24, bottom: -24, right: -24)
        
        //Alert Icon Image View
        alertIconImageView.center(in: alertIconHelperView)
        
        //Alert Message Label
        alertMessageLabel.center(in: alertMessageHelperView)
        NSLayoutConstraint.activate([
            alertMessageLabel.trailingAnchor.constraint(equalTo: alertMessageHelperView.trailingAnchor),
            alertMessageLabel.leadingAnchor.constraint(equalTo: alertMessageHelperView.leadingAnchor)
        ])
    }
}

//MARK: - Actions

extension ConfirmationAlertView {
    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
}

