//
//  UserProjectRankingCell.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//

import UIKit

class UserProjectRankingCell: UITableViewCell {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .Project.subscribedProjectBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.mainView"
        
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.mainStackView"
        
        return stackView
    }()
    
    lazy var placementStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.placementStackView"
        return stackView
    }()
    
    lazy var placementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.Assets.Images.thirdPlace)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectCell.placementImageView"
        return imageView
    }()
    
    lazy var medalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: K.Assets.Images.medal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectCell.placementImageView"
        
        return imageView
    }()
    
    lazy var medalHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.medalHelperView"
        return view
    }()
    
    lazy var projectTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectRankingCell.projectTitleLabel"
        
        return label
    }()
    
    lazy var congratulationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Parabéns! Você alcançou:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectRankingCell.congratulationsLabel"
        return label
    }()
    
    lazy var mentorCommentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .Project.disabledProjectBackgroundColor
        stackView.layer.cornerRadius = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectRankingCell.mentorCommentsStackView"
        
        return stackView
    }()
    
    lazy var mentorCommentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Comentários do Mentor"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectRankingCell.mentorCommentsStackView"
        
        return label
    }()
    
    lazy var mentorCommentsTitleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectRankingCell.mentorCommentsTitleHelperView"
        return view
    }()
    
    lazy var mentorCommentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus."
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectRankingCell.mentorCommentsStackView"
        return label
    }()
    
    lazy var mentorCommentsDescriptionHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "UserProjectRankingCell.mentorCommentsDescriptionHelperView"
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(using project: Project) {
        self.projectTitleLabel.text = project.name
    }
    
    func configureSubviews() {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(projectTitleLabel)
        mainStackView.addArrangedSubview(congratulationsLabel)
        mainStackView.addArrangedSubview(placementStackView)
        
        placementStackView.addArrangedSubview(placementImageView)
        placementStackView.addArrangedSubview(medalHelperView)
        
        medalHelperView.addSubview(medalImageView)
        
        mainStackView.addArrangedSubview(mentorCommentsStackView)
        
        mentorCommentsStackView.addArrangedSubview(mentorCommentsTitleHelperView)
        
        mentorCommentsTitleHelperView.addSubview(mentorCommentsTitleLabel)
        
        mentorCommentsStackView.addArrangedSubview(mentorCommentsDescriptionHelperView)
        
        mentorCommentsDescriptionHelperView.addSubview(mentorCommentsDescriptionLabel)
    }
    
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
        
        //Project Title Label
        NSLayoutConstraint.activate([
            projectTitleLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor)
        ])
        
        //Placement Stack View
        NSLayoutConstraint.activate([
            placementStackView.heightAnchor.constraint(equalToConstant: 133)
        ])
        
        //Medal Image View
        NSLayoutConstraint.activate([
            medalImageView.heightAnchor.constraint(equalToConstant: 104),
            medalImageView.widthAnchor.constraint(equalToConstant: 104),
            medalImageView.centerXAnchor.constraint(equalTo: medalHelperView.centerXAnchor),
            medalImageView.centerYAnchor.constraint(equalTo: medalHelperView.centerYAnchor)
        ])
        
        //Mentors Comments Stack View
        NSLayoutConstraint.activate([
            mentorCommentsStackView.heightAnchor.constraint(equalToConstant: 173)
        ])
        
        //Mentor Comments Title Label
        NSLayoutConstraint.activate([
            mentorCommentsTitleLabel.centerXAnchor.constraint(equalTo: mentorCommentsTitleHelperView.centerXAnchor),
            mentorCommentsTitleLabel.centerYAnchor.constraint(equalTo: mentorCommentsTitleHelperView.centerYAnchor)
        ])
        
        //Mentor Comments Title Helper View
        NSLayoutConstraint.activate([
            mentorCommentsTitleHelperView.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        //Mentor Comments Description Label
        NSLayoutConstraint.activate([
            mentorCommentsDescriptionLabel.leadingAnchor.constraint(equalTo: mentorCommentsTitleHelperView.leadingAnchor, constant: 9),
            mentorCommentsDescriptionLabel.trailingAnchor.constraint(equalTo: mentorCommentsTitleHelperView.trailingAnchor, constant: -9)
        ])
    }
}
