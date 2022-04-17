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
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.titleStackView"
        
        return stackView
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProejctCell.descriptionStackView"
        
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.mainStackView"
        
        return stackView
    }()
    
    lazy var progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.progressStackView"
        
        return stackView
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.font = .cardTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.titleLabel"
        
        return label
    }()
    
    lazy var mentor: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .cardSubtitleFont
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.mentorsLabel"
        
        return label
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.descriptionTitleLabel"
        
        return label
    }()
    
    lazy var descriptionLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.descriptionLabelView"
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.descriptionLabel"
        
        return label
    }()
    
    lazy var completionStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 26
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.accessibilityIdentifier = "StudentProjectCell.helpImageView"
        
        return stackview
    }()
    
    lazy var completionCircleHelpView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.completionCircleHelpView"
        
        return view
    }()
    
    lazy var completionBarCircleView: CircleProgressView = {
        let view = CircleProgressView(
            circleColor: .white,
            completionProgressColor: UIColor.purple.pharusPurple,
            radius: 40,
            completionPercentage: 50
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.descriptionTitleLabel"
        
        return view
    }()
    
    lazy var percentageCompletionLabel: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectCell.percentageCompletionLabel"
        
        return label
    }()
    
    lazy var daysRemainingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 11.67
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.daysRemainingStackView"
        
        return stackView
    }()
    
    lazy var daysRemainingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "8 dias"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.daysRemainingLabel"
        
        return label
    }()
    
    lazy var inspirationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.Assets.Icons.hourglassIcon)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.inspirationImageView"
        return imageView
    }()
    
    lazy var partnershipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 26
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.partnershipStackView"
        
        return stackView
    }()
    
    lazy var partnershipLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.partnershipLabelView"
        
        return view
    }()
    
    lazy var partnershipLabel: UILabel = {
        let label = UILabel()
        label.text = "Parceria: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.partnershipLabel"
        
        return label
    }()
    
    lazy var companyLogoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.companyLogoView"
        
        return view
    }()
    
    lazy var companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.Assets.Images.companyLogoImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.companyLogoImageView"
        
        return imageView
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
    
    func configureCell(using project: Project) {
        self.titleLabel.text = project.name
        self.descriptionLabel.text = project.projectDescription
        self.mentor.text = "Mentor: " + project.mentor
        self.completionBarCircleView.completionPercentage = project.completionStatus
        self.percentageCompletionLabel.text = project.completionStatus.description + "%"
        self.completionBarCircleView.completionPercentage = project.completionStatus
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = K.DateFormats.projectDateFormat
        
        let projectStartDate = dateFormatter.date(from: project.startDate) ?? Date()
        let projectEndDate = dateFormatter.date(from: project.endDate) ?? Date()
        
        self.daysRemainingLabel.text = Date.getDifferenceInDays(between: projectStartDate,
                                                                and: projectEndDate).description + " Dias"
    }
    
    func configureSubviews() {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleLabel)
        
        mainStackView.addArrangedSubview(mentor)
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
        
        completionStackView.addArrangedSubview(daysRemainingStackView)
        
        daysRemainingStackView.addArrangedSubview(inspirationImageView)
        daysRemainingStackView.addArrangedSubview(daysRemainingLabel)
        
        mainStackView.addArrangedSubview(partnershipStackView)
        
        partnershipStackView.addArrangedSubview(partnershipLabelView)
        
        partnershipLabelView.addSubview(partnershipLabel)
        
        partnershipStackView.addArrangedSubview(companyLogoView)
        
        companyLogoView.addSubview(companyLogoImageView)
        
        mainView.backgroundColor = UIColor.project.orangeSubscribedProjectBackground
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
            mentor.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
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
        
        //Inspiration Image View
        NSLayoutConstraint.activate([
            inspirationImageView.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        //Company Logo Image View
        NSLayoutConstraint.activate([
            companyLogoImageView.widthAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.heightAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.leadingAnchor.constraint(equalTo: companyLogoView.leadingAnchor),
            companyLogoImageView.centerYAnchor.constraint(equalTo: partnershipStackView.centerYAnchor)
        ])
        
        //Partnership Label
        NSLayoutConstraint.activate([
            partnershipLabel.trailingAnchor.constraint(equalTo: partnershipLabelView.trailingAnchor),
            partnershipLabel.centerYAnchor.constraint(equalTo: partnershipStackView.centerYAnchor),
        ])
        
    }
}
