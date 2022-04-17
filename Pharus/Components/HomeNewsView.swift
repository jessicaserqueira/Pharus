//
//  HomeNewsView.swift.swift
//  Pharus
//
//  Created by Victor Colen on 13/04/22.
//
import UIKit

class HomeNewsView: UIView {
    
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .card.orangeHomeStandardCardBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "HomeNewsView.view"
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "HomeNewsView.mainStackView"
        return stackView
    }()
    
    lazy var titleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "HomeNewsView.titleHelperView"
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Últimas notícias"
        label.font = .largeTitleBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "HomeNewsView.titleLabel"
        return label
    }()
    
    lazy var descriptionHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "HomeNewsView.descriptionHelperView"
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "A empresa XPTO, em parceria com a escola, lançou o projeto Voluntários Digitais. Dá uma olhadinha lá, quem sabe você se identifica com a proposta!"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "HomeNewsView.descriptionLabel"
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
        
        mainStackView.addArrangedSubview(titleHelperView)
        
        titleHelperView.addSubview(titleLabel)
        
        mainStackView.addArrangedSubview(descriptionHelperView)
        
        descriptionHelperView.addSubview(descriptionLabel)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        //Main View
        self.stretch(mainView)
        NSLayoutConstraint.activate([
            mainView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width)
        ])
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 17, left: 16, bottom: -17, right: -16)
        
        //Title Helper View
        NSLayoutConstraint.activate([
            titleHelperView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        //Title Label
        titleLabel.center(in: titleHelperView)
                
        //Description Label
        self.stretch(descriptionLabel, to: descriptionHelperView)
    }
    
}
