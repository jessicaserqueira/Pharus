//
//  ProjectSubcriptionAlertView.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

protocol ProjectSubcriptionAlertViewDelegate: AnyObject {
    func closeButtonTapped()
    func primaryButtonTapped()
    func secondaryButtonTapped()
}

class ProjectSubcriptionAlertView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ProjectSubcriptionAlertViewDelegate?
    private var title: String
    private var message: String
    private var mainButtonText: String
    private var secondaryButtonText: String
    
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
        view.backgroundColor = UIColor.modal.yellowBackground
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ProjectSubcriptionAlertView.mainView"
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectSubcriptionAlertView.mainStackView"
        
        return stackView
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectSubcriptionAlertView.titleStackView"
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.largeTitleSemiBold
        label.text = "Confirmar Inscrição"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSubcriptionAlertView.titleLabel"
        
        return label
    }()
    
    private lazy var closeModalButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.icons.xmarkIcon, for: .normal)
        button.addAction(UIAction { _ in
            self.closeButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ProjectSubcriptionAlertView.closeModalButton"
        
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumBody
        label.text = "Você deseja se inscrever no projeto \"Algoritmo no seu dia?\""
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSubcriptionAlertView.descriptionLabel"
        
        return label
    }()
    
    private lazy var primaryButton: MainCardButton = {
        let button = MainCardButton(title: "Sim, quero me inscrever", buttonState: .normal)
        button.addAction(UIAction { _ in
            self.primaryButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ProjectSubcriptionAlertView.primaryButton"
        
        return button
    }()
    
    private lazy var secondaryButton: SecondaryCardButton = {
        let button = SecondaryCardButton(title: "Não quero, mudei de ideia")
        button.addAction( UIAction { _ in
            self.secondaryButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ProjectSubcriptionAlertView.secondaryButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    convenience init(
        title: String,
        message: String,
        mainButtonText: String,
        secondaryButtonText: String
    ) {
        self.init()
        
        self.title = title
        self.message = message
        self.mainButtonText = mainButtonText
        self.secondaryButtonText = secondaryButtonText
        
        configureSubviews()
        customizeView()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.title = "Confirmar Inscrição"
        self.message = "Você deseja se inscrever no projeto ”Algoritmo no seu dia?"
        self.mainButtonText = "Sim, quero me inscrever"
        self.secondaryButtonText = "Não quero, mudei de idéia"
        
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
        
        mainStackView.addArrangedSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(closeModalButton)
        
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(primaryButton)
        mainStackView.addArrangedSubview(secondaryButton)
    }
    
    private func customizeView() {
        titleLabel.text = title
        descriptionLabel.text = message
        primaryButton.setTitle(mainButtonText, for: .normal)
        secondaryButton.setTitle(secondaryButtonText, for: .normal)
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        
        //Main View
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 314)
        ])
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 32, left: 16, bottom: -16, right: -13)
        
        //Close Modal Image View
        NSLayoutConstraint.activate([
            closeModalButton.heightAnchor.constraint(equalToConstant: 24),
            closeModalButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}

//MARK: - Actions

extension ProjectSubcriptionAlertView {
    
    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
    func primaryButtonTapped() {
        delegate?.primaryButtonTapped()
    }
    
    func secondaryButtonTapped() {
        delegate?.secondaryButtonTapped()
    }
}


