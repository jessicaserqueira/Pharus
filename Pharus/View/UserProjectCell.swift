//
//  UserProjectCell.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class UserProjectCell: UITableViewCell {
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.accessibilityIdentifier = "UserProjectCell.mainStackView"
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Titulo do projeto"
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
        self.mentorsLabel.text = project.mentors.joined(separator: ", ")
    }
    
    func configureSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(mentorsLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.backgroundColor = .purple
    }
    
    func setupConstraints() {
        self.stretch(mainStackView, top: 10, left: 30, bottom: -10, right: -30)
    }
}
