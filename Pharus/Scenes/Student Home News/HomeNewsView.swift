//
//  HomeNewsView.swift.swift
//  Pharus
//
//  Created by Victor Colen on 13/04/22.
//
import UIKit

class HomeNewsView: UIView {
    
    //MARK: - Properties
    private var news: String
    
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "HomeNewsView.view"
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "HomeNewsView.mainStackView"
        
        return stackView
    }()
    
    private lazy var titleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "HomeNewsView.titleHelperView"
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fique por dentro!"
        label.font = .largeTitleBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "HomeNewsView.titleLabel"
        
        return label
    }()
    
    private lazy var descriptionHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "HomeNewsView.descriptionHelperView"
        
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "A empresa XPTO, em parceria com a escola, lançou o projeto Voluntários Digitais. Dá uma olhadinha lá, quem sabe você se identifica com a proposta!"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .smallBody
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "HomeNewsView.descriptionLabel"
        
        return label
    }()
    
    //MARK: - Initializer
    
    convenience init(news: String) {
        self.init()
        
        self.news = news
        
        customizeSubviews()
    }
    
    override init(frame: CGRect) {
        news = "A empresa XPTO, em parceria com a escola, lançou o projeto Voluntários Digitais. Dá uma olhadinha lá, quem sabe você se identifica com a proposta!"
        
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
        
        mainStackView.addArrangedSubview(titleHelperView)
        
        titleHelperView.addSubview(titleLabel)
        
        mainStackView.addArrangedSubview(descriptionHelperView)
        
        descriptionHelperView.addSubview(descriptionLabel)
    }
    
    func customizeSubviews() {
        self.descriptionLabel.text = news
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
