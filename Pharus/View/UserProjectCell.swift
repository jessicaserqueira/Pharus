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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProejctCell.descriptionStackView"
        stackView.backgroundColor = .green
        
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
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
        label.text = "Titulo do projeto"
        label.numberOfLines = 1
        label.lineBreakMode = .byCharWrapping
        label.font = .systemFont(ofSize: 24, weight: .heavy)
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
    
    lazy var mentorsLabel: UILabel = {
        let label = UILabel()
        label.text = "mentores: etc etc etc"
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 1
        label.lineBreakMode = .byCharWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.mentorsLabel"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "ajfdlakjdflkah dfjha dsfjkhaskjdf jkasdhf kjsldhf akjhsdf hweui fysdjkn fpiue hfjdsn hfhaeu f"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.descriptionLabel"
        return label
    }()
    
    lazy var helpImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "asda.asdasd"
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var progressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Progress")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.progressImageView"
        
        return imageView
    }()
    
    lazy var completeLabel: UILabel = {
        let label = UILabel()
        label.text = "Completo"
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.completeLabel"
        
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
        self.mentorsLabel.text = "Mentores: " + project.mentors.joined(separator: ", ")
    }
    
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(medalImageView)
        mainStackView.addArrangedSubview(mentorsLabel)
        mainStackView.addArrangedSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(helpImageView)
        helpImageView.addSubview(progressStackView)
        progressStackView.addArrangedSubview(progressImageView)
        progressStackView.addArrangedSubview(completeLabel)
        mainView.backgroundColor = .cardColor
    }
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView, top: 10, left: 30, bottom: -10, right: -30)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 21),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -23),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 17),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        ])
        
        //Mentors Label
        NSLayoutConstraint.activate([
            mentorsLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])
        
        //help
        NSLayoutConstraint.activate([
            helpImageView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            helpImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        //Progress Image View
        NSLayoutConstraint.activate([
            progressImageView.widthAnchor.constraint(equalToConstant: 79),
            progressImageView.heightAnchor.constraint(equalToConstant: 79)
        ])
        
        //Progress Stack View
        NSLayoutConstraint.activate([
            progressStackView.centerXAnchor.constraint(equalTo: helpImageView.centerXAnchor),
            progressStackView.centerYAnchor.constraint(equalTo: helpImageView.centerYAnchor)
        ])
    }
}
