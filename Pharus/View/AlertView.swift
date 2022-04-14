//
//  AlertView.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//
import UIKit

class AlertView: UIView {
    
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .Project.subscribedProjectBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "AlertView.mainView"
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "AlertView.mainStackView"
        return stackView
    }()
    
    lazy var alertIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "AlertView.alertIconHelperView"
        return view
    }()
    
    lazy var alertIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .alertIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "AlertView.alertIconImageView"
        return imageView
    }()
    
    lazy var alertMessageHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "AlertView.alertMessageHelperView"
        return view
    }()
    
    lazy var alertMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "AlertView.alertMessageLabel"
        return label
    }()
    
    lazy var actionButton: MainCardButton = {
        let button = MainCardButton()
        button.setTitle("Fechar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "AlertView.actionButton"
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
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(blurEffectView)
        
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(alertIconHelperView)
        
        alertIconHelperView.addSubview(alertIconImageView)
        
        mainStackView.addArrangedSubview(alertMessageHelperView)
        
        alertMessageHelperView.addSubview(alertMessageLabel)
        
        mainStackView.addArrangedSubview(actionButton)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
       //Main View
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 217)
        ])
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 24, left: 24, bottom: -24, right: -24)
        
        //Alert Icon Helper View
        NSLayoutConstraint.activate([
            alertIconHelperView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
        
        //Alert Icon Image View
        NSLayoutConstraint.activate([
            alertIconImageView.centerYAnchor.constraint(equalTo: alertIconHelperView.centerYAnchor),
            alertIconImageView.centerXAnchor.constraint(equalTo: alertIconHelperView.centerXAnchor)
        ])
        
        //Alert Message Helper View
        NSLayoutConstraint.activate([
            alertMessageHelperView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //Alert Message Label
        NSLayoutConstraint.activate([
            alertMessageLabel.centerYAnchor.constraint(equalTo: alertMessageHelperView.centerYAnchor),
            alertMessageLabel.centerXAnchor.constraint(equalTo: alertMessageHelperView.centerXAnchor)
        ])
    }
    
}
