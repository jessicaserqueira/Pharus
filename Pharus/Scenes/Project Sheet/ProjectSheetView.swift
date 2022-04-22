//
//  ProjectRulesView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

protocol ProjectSheetDelegate: AnyObject {
    func closeButtonTapped()
}

class ProjectSheetView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ProjectSheetDelegate?
    
    private var project: ProjectModel
    private var sheetContent: SheetContent
    
    enum SheetContent {
        case activities
        case mentorReview
    }
    
    //MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.modal.yellowBackground
        scrollView.layer.cornerRadius = 16
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "ProjectSheetView.scrollView"
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 46
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
        imageView.image = UIImage.icons.feedbackIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "ProjectSheetView.titleIconImageView"
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .largeTitleBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSheetView.titleLabel"
        return label
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectSheetView.descriptionStackView"
        return stackView
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumTitleBold
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSheetView.descriptionTitleLabel"
        return label
    }()
    
    private lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .smallBody
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectSheetView.descriptionTextLabel"
        
        return label
    }()
    
    private lazy var closeButton: MainCardButton = {
        let button = MainCardButton()
        button.setTitle("Fechar", for: .normal)
        button.addAction(UIAction { _ in
            self.closeButtonTapped()
        }, for: .touchUpInside)
        button.accessibilityIdentifier = "ProjectSheetView.closeButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    convenience init(
        project: ProjectModel,
        sheetContent: SheetContent
    ) {
        self.init()
        
        self.project = project
        self.sheetContent = sheetContent
        
        configureSubviews()
        customizeSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        self.project = StudentModel.defaultProject
        self.sheetContent = .mentorReview
        
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
        
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(descriptionTitleLabel)
        descriptionStackView.addArrangedSubview(descriptionTextLabel)
        
        mainStackView.addArrangedSubview(closeButton)
    }
    
    private func customizeSubviews() {
        if sheetContent == .mentorReview {
            titleIconImageView.image = UIImage.icons.feedbackIcon
            titleLabel.text = "Avaliação do Mentor"
            descriptionTextLabel.text = project.scoreDescription
        } else {
            titleIconImageView.image = UIImage.icons.rulesIcon
            titleLabel.text = "Atividades"
            var descriptionText = ""
            for task in project.tasks {
                descriptionText += "\(task.title) - \(task.taskDescription)\n\n"
            }
            descriptionTextLabel.text = descriptionText
        }
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
    func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
}
