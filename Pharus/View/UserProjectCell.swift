//
//  UserProjectCell.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class UserProjectCell: UITableViewCell {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.mainView"
        
        return view
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.titleStackView"
        stackView.backgroundColor = .yellow
        
        return stackView
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProejctCell.descriptionStackView"
        stackView.backgroundColor = .green
        
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.mainStackView"
        stackView.backgroundColor = .purple
        
        return stackView
    }()
    
    lazy var progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.progressStackView"
        
        return stackView
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.titleLabel"
        
        return label
    }()
    
    lazy var medalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.AssetsNames.medal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.medalImageView"
        
        return imageView
    }()
    
    lazy var mentor: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 18)
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.mentorsLabel"
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.descriptionLabel"
        
        return label
    }()
    
    lazy var helpImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectCell.helpImageView"
        view.backgroundColor = .blue
        
        return view
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.descriptionTitleLabel"
        return label
    }()
    
    lazy var completionBarCircleView: CircleView = {
        let view = CircleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trackColor = .yellow
        view.progressColor = .red
        view.accessibilityIdentifier = "UserProjectCell.descriptionTitleLabel"
        return view
    }()
        
    lazy var daysRemainingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Este projeto finaliza em 8 dias"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.daysRemainingLabel"
        return label
    }()
    
    lazy var partnershipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.partnershipStackView"
        stackView.backgroundColor = .red
        
        return stackView
    }()
    
    lazy var partnershipLabel: UILabel = {
        let label = UILabel()
        label.text = "Realizado em parceria com"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.partnershipLabel"
        
        return label
    }()
    
    lazy var companyLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.AssetsNames.companyLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.companyLogoImageView"
        return imageView
    }()
    
    lazy var percentageCompletionLabel: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.percentageCompletionLabel"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(project: Project) {
        self.titleLabel.text = project.name
        self.descriptionLabel.text = project.projectDescription
        self.mentor.text = "Mentor: " + project.mentor
        self.completionBarCircleView.percentage = Double(project.completionStatus)
        self.percentageCompletionLabel.text = String(project.completionStatus) + "%"
        
    }
    
    func configureSubviews() {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleStackView)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(medalImageView)
        
        mainStackView.addArrangedSubview(mentor)
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(helpImageView)
        
        helpImageView.addSubview(percentageCompletionLabel)
        
        mainStackView.addArrangedSubview(daysRemainingLabel)
        mainStackView.addArrangedSubview(partnershipStackView)
        
        partnershipStackView.addArrangedSubview(partnershipLabel)
        partnershipStackView.addArrangedSubview(companyLogoImageView)
                
        helpImageView.addSubview(completionBarCircleView)
        
        mainView.backgroundColor = .cardColor
    }
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView, top: 10, left: 16, bottom: -10, right: -16)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 21),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -23),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 17),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        ])
        
        //Mentors Label
        NSLayoutConstraint.activate([
            mentor.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])
        
        //help
        NSLayoutConstraint.activate([
            helpImageView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
        ])
        
        //Description Stack View
        NSLayoutConstraint.activate([
            descriptionStackView.heightAnchor.constraint(equalToConstant: 158)
        ])
        
        //Company Logo Image View
        NSLayoutConstraint.activate([
            companyLogoImageView.widthAnchor.constraint(equalToConstant: 66),
            companyLogoImageView.heightAnchor.constraint(equalToConstant: 66)
        ])
                
        //Percentage Completion Label
        NSLayoutConstraint.activate([
            percentageCompletionLabel.centerXAnchor.constraint(equalTo: helpImageView.centerXAnchor),
            percentageCompletionLabel.centerYAnchor.constraint(equalTo: helpImageView.centerYAnchor),
        ])
        
        //Completion Bar Circle View
        NSLayoutConstraint.activate([
            completionBarCircleView.centerXAnchor.constraint(equalTo: helpImageView.centerXAnchor),
            completionBarCircleView.centerYAnchor.constraint(equalTo: helpImageView.centerYAnchor),
        ])
    }
}
