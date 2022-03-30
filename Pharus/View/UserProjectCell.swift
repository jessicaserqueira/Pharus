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
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 41
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.mainStackView"
        //stackView.backgroundColor = .red
        return stackView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "UserProjectCell.infoStackView"
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Titulo do projeto"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "UserProjectCell.titleLabel"
        return label
    }()
    
    lazy var mentorsLabel: UILabel = {
        let label = UILabel()
        label.text = "mentores: etc etc etc"
        label.font = .systemFont(ofSize: 15)
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
       // view.backgroundColor = .blue
        return view
    }()
    
    lazy var progressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Progress")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "UserProjectCell.progressImageView"
        return imageView
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
        mainStackView.addArrangedSubview(infoStackView)
        
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(mentorsLabel)
        infoStackView.addArrangedSubview(descriptionLabel)
        
        mainStackView.addArrangedSubview(helpImageView)
        helpImageView.addSubview(progressImageView)
        mainView.backgroundColor = .cardColor
    }
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView, top: 10, left: 30, bottom: -10, right: -30)
        
        //Main Stack View
       // self.stretch(mainStackView, to: mainView, top: 17, left: 21, bottom: -18, right: 21)
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 21),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -23),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 17),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20)
        ])
        
        //Info Stack View
        //infoStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -10).isActive = true
        
        //help
        NSLayoutConstraint.activate([
            helpImageView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            helpImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        //Progress Image View
        NSLayoutConstraint.activate([
            progressImageView.widthAnchor.constraint(equalToConstant: 79),
            progressImageView.heightAnchor.constraint(equalToConstant: 79),
            progressImageView.centerXAnchor.constraint(equalTo: helpImageView.centerXAnchor),
            progressImageView.centerYAnchor.constraint(equalTo: helpImageView.centerYAnchor)
        ])
        
    }
}
