//
//  StudentHomeView.swift
//  Pharus
//
//  Created by Victor Colen on 12/04/22.
//
import UIKit

class StudentHomeMiniCardView: UIView {
    
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeMiniCardView.mainView"
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentHomeMiniCardView.mainStackView"
        return stackView
    }()
    
    lazy var cardIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeMiniCardView.cardIconHelperView"
        return view
    }()
    
    lazy var cardIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .images.fifthPlaceMedalImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentHomeMiniCardView.cardIconImageView"
        return imageView
    }()
    
    lazy var cardDescriptionHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeMiniCardView.cardDescriptionHelperView"
        return view
    }()
    
    lazy var cardDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "O projeto ”Introdução a Robótica” te deu uma medalha!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentHomeMiniCardView.cardDescriptionLabel"
        return label
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
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(cardIconHelperView)
        
        cardIconHelperView.addSubview(cardIconImageView)
        
        mainStackView.addArrangedSubview(cardDescriptionHelperView)
        
        cardDescriptionHelperView.addSubview(cardDescriptionLabel)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
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
