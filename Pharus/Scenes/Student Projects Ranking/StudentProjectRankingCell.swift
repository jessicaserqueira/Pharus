//
//  UserProjectRankingCell.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//
import UIKit

class StudentProjectRankingCell: UITableViewCell {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple.pharusPurple
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.mainView"
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.mainStackView"
        
        return stackView
    }()
    
    private lazy var projectTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .largeTitleBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectRankingCell.projectTitleLabel"
        
        return label
    }()
    
    private lazy var congratulationsHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectRankingCell.congratulationsHelperView"
        
        return view
    }()
    
    private lazy var congratulationsLabel: UILabel = {
        let label = UILabel()
        label.text = "Parabéns! Você alcançou o"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = .mediumTitleSemiBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectRankingCell.congratulationsLabel"
        
        return label
    }()
    
    private lazy var placementStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectCell.placementStackView"
        
        return stackView
    }()
    
    private lazy var placementHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.placementHelperView"
       
        return view
    }()
    
    private lazy var placementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.thirdPlaceImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectCell.placementImageView"
       
        return imageView
    }()
    
    private lazy var medalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.thirdPlaceMedalImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectCell.placementImageView"
        
        return imageView
    }()
    
    private lazy var medalHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectCell.medalHelperView"
        
        return view
    }()
    
    private lazy var mentorCommentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsStackView"
        
        return stackView
    }()
    
    private lazy var mentorCommentsTitleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsTitleHelperView"
        
        return view
    }()
    
    private lazy var mentorCommentsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Comentários do Mentor"
        label.font = .mediumBodyBold
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsStackView"
        
        return label
    }()
    
    private lazy var mentorCommentsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus."
        label.font = .smallBody
        label.textColor = .white
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsStackView"
        
        return label
    }()
    
    private lazy var mentorCommentsDescriptionHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectRankingCell.mentorCommentsDescriptionHelperView"
        
        return view
    }()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    func configureCell(using project: ProjectModel) {
        self.projectTitleLabel.text = project.name
        mentorCommentsDescriptionLabel.text = project.scoreDescription
        configureSubviews(with: project)
        setupConstraints()
    }
    
    private func configureSubviews(with project: ProjectModel) {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(projectTitleLabel)
        mainStackView.addArrangedSubview(congratulationsHelperView)
        
        congratulationsHelperView.addSubview(congratulationsLabel)
        
        mainStackView.addArrangedSubview(placementStackView)
        
        placementStackView.addArrangedSubview(placementHelperView)
        
        placementHelperView.addSubview(placementImageView)
        
        placementStackView.addArrangedSubview(medalHelperView)
        
        medalHelperView.addSubview(medalImageView)
        
        mainStackView.addArrangedSubview(mentorCommentsStackView)
        
        mentorCommentsStackView.addArrangedSubview(mentorCommentsTitleHelperView)
        
        mentorCommentsTitleHelperView.addSubview(mentorCommentsTitleLabel)
        
        mentorCommentsStackView.addArrangedSubview(mentorCommentsDescriptionHelperView)
        
        mentorCommentsDescriptionHelperView.addSubview(mentorCommentsDescriptionLabel)
        
        setPlacementImages(with: project)
    }
    
    private func setPlacementImages(with project: ProjectModel) {
        guard let projectPlacement = project.placement else {
            return
        }
        
        if projectPlacement < 6 {
            switch project.placement {
            case 1:
                placementImageView.image = UIImage.images.firstPlaceImage
                medalImageView.image = UIImage.images.firstPlaceMedalImage
            case 2:
                placementImageView.image = UIImage.images.secondPlaceImage
                medalImageView.image = UIImage.images.secondPlaceMedalImage
            case 3:
                placementImageView.image = UIImage.images.thirdPlaceImage
                medalImageView.image = UIImage.images.thirdPlaceMedalImage
            case 4:
                placementImageView.image = UIImage.images.fourthPlaceImage
                medalImageView.image = UIImage.images.fourthPlaceMedalImage
            default:
                placementImageView.image = UIImage.images.fifthPlaceImage
                medalImageView.image = UIImage.images.fifthPlaceMedalImage
            }
            
            //Placement Image View
            placementImageView.center(in: placementHelperView)
            NSLayoutConstraint.activate([
                placementImageView.heightAnchor.constraint(equalToConstant: 102),
                placementImageView.widthAnchor.constraint(equalTo: placementHelperView.widthAnchor)
            ])
            
            //Medal Image View
            medalImageView.center(in: medalHelperView)
            NSLayoutConstraint.activate([
                medalImageView.heightAnchor.constraint(equalToConstant: 104),
                medalImageView.widthAnchor.constraint(equalToConstant: 104)
            ])
            
        } else {
            placementImageView.removeFromSuperview()
            medalImageView.removeFromSuperview()
            congratulationsLabel.text = "Parabéns! Você completou o projeto e sua colocação foi:"
            
            placementStackView.axis = .vertical
            placementStackView.removeFullyAllArrangedSubviews()
            
            let notOnPodiumLabel = UILabel()
            notOnPodiumLabel.font = .largeTitleBold
            notOnPodiumLabel.textColor = .white
            notOnPodiumLabel.text = "\(project.placement ?? 6)º Lugar"
            notOnPodiumLabel.textAlignment = .center
            
            placementStackView.addArrangedSubview(notOnPodiumLabel)
            mentorCommentsTitleLabel.font = UIFont.mediumBody
        }
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        
        //Main View
        self.stretch(mainView, top: 16, left: 16, bottom: -16, right: -16)
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 24.5, left: 8, bottom: -8, right: -8)
        
        //Project Title Label
        NSLayoutConstraint.activate([
            projectTitleLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor)
        ])
        
        //Congratulations Helper View
        NSLayoutConstraint.activate([
            congratulationsHelperView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        //Congratulations Label
        congratulationsLabel.center(in: congratulationsHelperView)
        NSLayoutConstraint.activate([
            congratulationsLabel.trailingAnchor.constraint(equalTo: congratulationsHelperView.trailingAnchor),
            congratulationsLabel.leadingAnchor.constraint(equalTo: congratulationsHelperView.leadingAnchor)
        ])
        
        //Placement Stack View
        NSLayoutConstraint.activate([
            placementStackView.heightAnchor.constraint(equalToConstant: 133)
        ])
        
        //Mentor Comments Title Helper View
        NSLayoutConstraint.activate([
            mentorCommentsTitleHelperView.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        //Mentor Comments Title Label
        mentorCommentsTitleLabel.center(in: mentorCommentsTitleHelperView)
        
        //Mentor Comment Description Helper View
        NSLayoutConstraint.activate([
            mentorCommentsDescriptionHelperView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
        //Mentor Comments Description Label
        NSLayoutConstraint.activate([
            mentorCommentsDescriptionLabel.leadingAnchor.constraint(equalTo: mentorCommentsTitleHelperView.leadingAnchor, constant: 9),
            mentorCommentsDescriptionLabel.trailingAnchor.constraint(equalTo: mentorCommentsTitleHelperView.trailingAnchor, constant: -9)
        ])
    }
}
