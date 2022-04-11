//
//  ProjectTaskView.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

class ProjectTaskView: UIView {
    
    //MARK: - Views
    
    lazy var mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 11
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectTaskViewView.individualStackView"
        return stackView
    }()
    
    lazy var taskTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 11
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectTaskViewView.taskTitleStackView"
        return stackView
    }()

    lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectTaskViewView.taskTitleLabel"
        return label
    }()

    lazy var taskCheckboxButton: CheckmarkButton = {
        let button = CheckmarkButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ProjectTaskViewView.taskCheckboxButton"
        return button
    }()
    
    lazy var taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectTaskViewView.taskDescriptionLabel"
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(taskTitleStackView)
        
        taskTitleStackView.addArrangedSubview(taskCheckboxButton)
        taskTitleStackView.addArrangedSubview(taskTitleLabel)
        
        mainStackView.addArrangedSubview(taskDescriptionLabel)
    }
    
    func customizeView(using task: Task) {
        taskTitleLabel.text = task.title
        taskDescriptionLabel.text = task.taskDescription
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {

        self.stretch(mainStackView)
        
        NSLayoutConstraint.activate([
            taskCheckboxButton.widthAnchor.constraint(equalToConstant: 25),
            taskCheckboxButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
