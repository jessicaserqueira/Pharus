//
//  AlertView.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//
import UIKit

protocol AlertViewDelegate: AnyObject {
    func closeButtonTapped()
}

class AlertView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: AlertViewDelegate?
    private var image: UIImage
    private var message: String
    
    //MARK: - Views
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.project.orangeSubscribedProjectBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "AlertView.mainView"
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "AlertView.mainStackView"
        
        return stackView
    }()
    
    private lazy var alertIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "AlertView.alertIconHelperView"
        
        return view
    }()
    
    private lazy var alertIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "AlertView.alertIconImageView"
        
        return imageView
    }()
    
    private lazy var alertMessageHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "AlertView.alertMessageHelperView"
        
        return view
    }()
    
    private lazy var alertMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "AlertView.alertMessageLabel"
        
        return label
    }()
    
    private lazy var actionButton: MainCardButton = {
        let button = MainCardButton()
        button.setTitle("Fechar", for: .normal)
        
        button.addAction(UIAction { _ in
            self.closeButtonTapped()
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "AlertView.actionButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    convenience init(message: String, image: UIImage) {
        self.init()
        
        self.message = message
        self.image = image
        
        configureSubviews()
        customizeView()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.message = "Alerta"
        self.image = UIImage(named: K.Assets.Icons.rulesIcon)!
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        
        let blurEffect = UIBlurEffect(style: .light)
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
    
    private func customizeView() {
        alertMessageLabel.text = message
        alertIconImageView.image = image
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

extension AlertView {
    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
}

