//
//  ProjectRulesView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

protocol ProjectSheetDelegate: AnyObject {
    func mainButtonTapped()
}

class ProjectSheetView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ProjectSheetDelegate?
    private var icon: UIImage
    private var title: String
    private var descriptionTitle: String
    private var descriptionText: String
    private var buttonTitle: String
    
    //MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .Modal.modalBackgroundColor
        scrollView.layer.cornerRadius = 16
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "ProjectSheetView.scrollView"
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectSheetView.mainStackView"
        
        return stackView
    }()
    
    private lazy var titleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ProjectSheetView.titleHelperView"
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectSheetView.titleStackView"
        return stackView
    }()
    
    private lazy var titleIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = icon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "ProjectSheetView.titleIconImageView"
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .cardTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSheetView.titleLabel"
        return label
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = descriptionTitle
        label.font = .cardSubtitleFont
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSheetView.descriptionTitleLabel"
        return label
    }()
    
    private lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.text = descriptionText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSheetView.descriptionTextLabel"
        
        return label
    }()
    
    private lazy var closeButton: MainCardButton = {
        let button = MainCardButton()
        button.setTitle(buttonTitle, for: .normal)
        button.addAction(UIAction { _ in
            self.mainButtonTapped()
        }, for: .touchUpInside)
        button.accessibilityIdentifier = "ProjectSheetView.closeButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    convenience init(
        viewTitle: String,
        descriptionTitle: String,
        descriptionText: String,
        mainButtonTitle: String
    ) {
        self.init()
        
        self.title = viewTitle
        self.descriptionTitle = descriptionTitle
        self.descriptionText = descriptionText
        self.buttonTitle = mainButtonTitle
        
        configureSubviews()
        customizeSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        title = "Comentários do mentor"
        descriptionTitle = "Tarefa 01"
        descriptionText = "Parabéns pela dedicação e empenho em entregar a tarefa do projeto.\n\nA utilização da metodologia em um determinado momento ficou ausente, fugindo do proposto pela tarefa.\n\nPeço que faça uma revisão no material e continue a dedicação para as próximas tarefas"
        buttonTitle = "Fechar"
        self.icon = .strokedCheckmark
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(scrollView)
        
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleHelperView)
        
        titleHelperView.addSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleIconImageView)
        titleStackView.addArrangedSubview(titleLabel)
        
        mainStackView.addArrangedSubview(descriptionTitleLabel)
        mainStackView.addArrangedSubview(descriptionTextLabel)
        mainStackView.addArrangedSubview(closeButton)
    }
    
    private func customizeSubviews() {
        titleIconImageView.image = icon
        titleLabel.text = title
        descriptionTitleLabel.text = descriptionTitle
        descriptionTextLabel.text = descriptionText
        closeButton.setTitle(buttonTitle, for: .normal)
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        self.stretch(scrollView)
        
        self.stretch(mainStackView, to: scrollView, top: 32, left: 25, bottom: -24, right: -25)
        mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        //Title Helper View
        NSLayoutConstraint.activate([
            titleHelperView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        //Title Stack View
        titleStackView.center(in: titleHelperView)
        
        //Title Icon Image View
        NSLayoutConstraint.activate([
            titleIconImageView.heightAnchor.constraint(equalToConstant: 48),
            titleIconImageView.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
}

//MARK: - Actions

extension ProjectSheetView {
    func mainButtonTapped() {
        delegate?.mainButtonTapped()
    }
}
