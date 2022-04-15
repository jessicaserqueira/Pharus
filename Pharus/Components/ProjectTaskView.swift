//
//  ProjectTaskView.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

protocol ProjectTaskDelegate: AnyObject {
    func checkmarkButtonTapped(task: Task)
}

class ProjectTaskView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ProjectTaskDelegate?
    var task: Task
    
    //MARK: - Views
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 11
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectTaskViewView.individualStackView"
        return stackView
    }()
    
    private lazy var taskTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 11
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectTaskViewView.taskTitleStackView"
        return stackView
    }()
    
    private lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectTaskViewView.taskTitleLabel"
        return label
    }()
    
    lazy var taskCheckboxButton: CheckmarkButton = {
        let button = CheckmarkButton(checkImage: .checkmarkImage!)
        button.addAction(UIAction { _ in
            self.checkmarkButtonTapped(task: self.task)
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ProjectTaskViewView.taskCheckboxButton"
        return button
    }()
    
    private lazy var taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectTaskViewView.taskDescriptionLabel"
        return label
    }()
    
    //MARK: - Initializer
    
    convenience init(task: Task) {
        self.init()
        
        self.task = task
        configureSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        
        self.task = Task(
            title: "sou uma task",
                         isComplete: false,
                         description: "Lorem Ipsum"
        )
        
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
        
        taskTitleLabel.text = task.title
        taskDescriptionLabel.text = task.taskDescription
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        
        self.stretch(mainStackView)
        
        NSLayoutConstraint.activate([
            taskCheckboxButton.widthAnchor.constraint(equalToConstant: 25),
            taskCheckboxButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

//MARK: - Actions

extension ProjectTaskView {
    func checkmarkButtonTapped(task: Task) {
        delegate?.checkmarkButtonTapped(task: task)
    }
}
