//
//  UserProjectCell.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectCell: UITableViewCell {
    
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.mainView"
        
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.titleStackView"
        
        return stackView
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProejctCell.descriptionStackView"
        
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.mainStackView"
        
        return stackView
    }()
    
    private lazy var progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.progressStackView"
        
        return stackView
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.font = .largeTitleBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.titleLabel"
        
        return label
    }()
    
    private lazy var mentorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .mediumTitleBold
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.mentorsLabel"
        
        return label
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .mediumTitleSemiBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.descriptionTitleLabel"
        
        return label
    }()
    
    private lazy var descriptionLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.descriptionLabelView"
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .smallBody
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.descriptionLabel"
        
        return label
    }()
    
    private lazy var completionStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 26
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.accessibilityIdentifier = "StudentProjectCell.helpImageView"
        
        return stackview
    }()
    
    private lazy var completionCircleHelpView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.completionCircleHelpView"
        
        return view
    }()
    
    private lazy var completionBarCircleView: CircleProgressView = {
        let view = CircleProgressView(
            circleColor: .white,
            completionProgressColor: UIColor.purple.pharusPurple,
            radius: 45,
            progress: 50
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.descriptionTitleLabel"
        
        return view
    }()
    
    private lazy var percentageCompletionLabel: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.font = .smallBody
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.percentageCompletionLabel"
        
        return label
    }()
    
    private lazy var projectScheduleView: ProjectScheduleView = {
        let view = ProjectScheduleView(project: StudentModel.defaultProject)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.projectScheduleView"
        return view
    }()
    
    private lazy var lowerHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.lowerHelperView"
        return view
    }()
    
    private lazy var lowerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.lowerStackView"
        
        return stackView
    }()
    
    private lazy var partnershipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.partnershipStackView"
        
        return stackView
    }()
    
    private lazy var partnershipHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.partnershipHelperView"
        
        return view
    }()
    
    private lazy var partnershipLabel: UILabel = {
        let label = UILabel()
        label.text = "Parceira: "
        label.font = .smallBodyBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.partnershipLabel"
        
        return label
    }()
    
    private lazy var companyLogoHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.companyLogoHelperView"
        
        return view
    }()
    
    private lazy var companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.companies.ioasysLogoImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.companyLogoImageView"
        
        return imageView
    }()
    
    private lazy var subscribeHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.subscribeHelperView"
        return view
    }()
    
    lazy var subscribeButton: SubscribeButton = {
        let button = SubscribeButton(isSubscribed: true)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "UserProjectCell.subscribeButton"
        return button
    }()
    
    //MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    func configureCell(using project: ProjectModel) {
        titleLabel.text = project.name
        descriptionLabel.text = project.projectDescription
        mentorLabel.text = "Mentor: " + project.mentor
        projectScheduleView.project = project
        subscribeButton.isSubscribed = project.isSubscribed
        companyLogoImageView.image = UIImage(
            named: "\(project.company!.lowercased())LogoImage"
        )
        
        completionBarCircleView.progress = project.completionPercentage*100
        percentageCompletionLabel.text = "\(project.completedTasksCount)/\(project.tasks.count)"
        
        if project.isSubscribed {
            mainView.backgroundColor = UIColor.project.orangeSubscribedProjectBackground
        } else {
            mainView.backgroundColor = UIColor.project.grayUnsubscribedProjectBackground
        }
    }
    
    func configureSubviews() {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleLabel)
        
        mainStackView.addArrangedSubview(mentorLabel)
        mainStackView.addArrangedSubview(descriptionTitleLabel)
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(descriptionLabelView)
        
        descriptionLabelView.addSubview(descriptionLabel)
        
        descriptionStackView.addArrangedSubview(completionStackView)
        
        completionStackView.addArrangedSubview(completionCircleHelpView)
        
        completionCircleHelpView.addSubview(completionBarCircleView)
        
        //Making circle start from intended position
        completionBarCircleView.transform = CGAffineTransform(rotationAngle: 180.7)
        
        completionCircleHelpView.addSubview(percentageCompletionLabel)
        
        completionStackView.addArrangedSubview(projectScheduleView)
        
        mainStackView.addArrangedSubview(lowerStackView)
        
        lowerStackView.addArrangedSubview(partnershipStackView)
        
        partnershipStackView.addArrangedSubview(partnershipHelperView)
        
        partnershipHelperView.addSubview(partnershipLabel)
        
        partnershipStackView.addArrangedSubview(companyLogoHelperView)
        
        companyLogoHelperView.addSubview(companyLogoImageView)
        
        lowerStackView.addArrangedSubview(subscribeHelperView)
        
        subscribeHelperView.addSubview(subscribeButton)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView, top: 16, left: 16, bottom: -16, right: -16)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24.5),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -8)
        ])
        
        //Mentors Label
        NSLayoutConstraint.activate([
            mentorLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])
        
        //Completion Stack View
        NSLayoutConstraint.activate([
            completionStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
        ])
        
        //Description Stack View
        NSLayoutConstraint.activate([
            descriptionStackView.heightAnchor.constraint(equalToConstant: 144)
        ])
        
        //Description Label
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descriptionLabelView.topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionLabelView.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionLabelView.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionLabelView.bottomAnchor)
        ])
        
        //Percentage Completion Label
        NSLayoutConstraint.activate([
            percentageCompletionLabel.centerXAnchor.constraint(equalTo: completionCircleHelpView.centerXAnchor),
            percentageCompletionLabel.centerYAnchor.constraint(equalTo: completionCircleHelpView.centerYAnchor)
        ])
        
        //Completion Bar Circle View
        NSLayoutConstraint.activate([
            completionBarCircleView.centerXAnchor.constraint(equalTo: completionCircleHelpView.centerXAnchor),
            completionBarCircleView.centerYAnchor.constraint(equalTo: completionCircleHelpView.centerYAnchor)
        ])
        
        //Project Schedule View
        NSLayoutConstraint.activate([
            projectScheduleView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        //Company Logo Image View
        NSLayoutConstraint.activate([
            companyLogoImageView.widthAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.heightAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.leadingAnchor.constraint(equalTo: companyLogoHelperView.leadingAnchor),
            companyLogoImageView.centerYAnchor.constraint(equalTo: partnershipStackView.centerYAnchor)
        ])
        
        //Partnership Label
        NSLayoutConstraint.activate([
            partnershipLabel.trailingAnchor.constraint(equalTo: partnershipHelperView.trailingAnchor),
            partnershipLabel.centerYAnchor.constraint(equalTo: partnershipStackView.centerYAnchor),
        ])
        
        //Subscribe Button
        subscribeButton.center(in: subscribeHelperView)
    }
}
