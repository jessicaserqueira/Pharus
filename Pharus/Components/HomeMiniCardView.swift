//
//  StudentHomeView.swift
//  Pharus
//
//  Created by Victor Colen on 12/04/22.
//
import UIKit

class StudentHomeMiniCardView: UIView {
    
    //MARK: - Properties
    private var cardType: HomeCardType
    private var message: String
    
    enum HomeCardType {
        case warning
        case newProject
        case newMedal
    }
    
    //MARK: - Views
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeMiniCardView.mainView"
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentHomeMiniCardView.mainStackView"
        
        return stackView
    }()
    
    private lazy var cardIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeMiniCardView.cardIconHelperView"
        
        return view
    }()
    
    private lazy var cardIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.fifthPlaceMedalImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentHomeMiniCardView.cardIconImageView"
        
        return imageView
    }()
    
    private lazy var cardDescriptionHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeMiniCardView.cardDescriptionHelperView"
        
        return view
    }()
    
    private lazy var cardDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "O projeto ”Introdução a Robótica” te deu uma medalha!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentHomeMiniCardView.cardDescriptionLabel"
        
        return label
    }()
    
    //MARK: - Initializer
    
    convenience init(
        cardType: HomeCardType,
        message: String
    ) {
        self.init()
        
        self.cardType = cardType
        self.message = message
        
        
        customizeSubviews()
    }
    
    override init(frame: CGRect) {
        
        self.cardType = .newProject
        self.message = "O projeto ”Introdução a Robótica” te deu uma medalha!"
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    private func configureSubviews() {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(cardIconHelperView)
        
        cardIconHelperView.addSubview(cardIconImageView)
        
        mainStackView.addArrangedSubview(cardDescriptionHelperView)
        
        cardDescriptionHelperView.addSubview(cardDescriptionLabel)
    }
    
    private func customizeSubviews() {
        if cardType == .newProject {
            mainView.backgroundColor = UIColor.card.orangeHomeStandardCardBackground
            cardIconImageView.image = UIImage.icons.companyIcon
        } else if cardType == .warning {
            mainView.backgroundColor = UIColor.card.yellowHomeAlertCardBackground
            cardIconImageView.image = UIImage.icons.warningIcon
        } else {
            mainView.backgroundColor = UIColor.card.orangeHomeStandardCardBackground
            cardIconImageView.image = UIImage.icons.medalIcon
        }
        
        cardDescriptionLabel.text = message
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        //Main View
        self.stretch(mainView)
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 10, left: 10, bottom: -10, right: -10)
        
        //Card Icon Helper View
        NSLayoutConstraint.activate([
            cardIconHelperView.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        //Card Icon Image View
        cardIconImageView.center(in: cardIconHelperView)
        
        //Card Description Label
        cardDescriptionLabel.center(in: cardDescriptionHelperView)
        NSLayoutConstraint.activate([
            cardDescriptionLabel.leadingAnchor.constraint(equalTo: cardDescriptionHelperView.leadingAnchor),
            cardDescriptionLabel.trailingAnchor.constraint(equalTo: cardDescriptionHelperView.trailingAnchor),
            cardDescriptionLabel.bottomAnchor.constraint(equalTo: cardDescriptionHelperView.bottomAnchor)
        ])
    }
}
