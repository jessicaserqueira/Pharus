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
    private var checkImage: UIImage
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
    
    lazy var taskCheckmarkButton: CheckmarkButton = {
        let button = CheckmarkButton()
        button.addAction(UIAction { _ in
            self.checkmarkButtonTapped(task: self.task)
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "ProjectTaskViewView.taskCheckmarkButton"
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
    
    convenience init(task: Task, checkImage: UIImage) {
        self.init()
        
        self.task = task
        self.checkImage = checkImage
        
        configureSubviews()
        customizeSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        
        self.task = Task(
            title: "Tarefa",
            isComplete: false,
            description: "Lorem Ipsum"
        )
        
        self.checkImage = .icons.checkmarkIcon ?? .defaultImage
        
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
        
        taskTitleStackView.addArrangedSubview(taskCheckmarkButton)
        taskTitleStackView.addArrangedSubview(taskTitleLabel)
        
        mainStackView.addArrangedSubview(taskDescriptionLabel)
    }
    
    func customizeSubviews() {
        taskTitleLabel.text = task.title
        taskDescriptionLabel.text = task.taskDescription
        taskCheckmarkButton.setImage(self.checkImage, for: .normal)
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        
        self.stretch(mainStackView)
        
        NSLayoutConstraint.activate([
            taskCheckmarkButton.widthAnchor.constraint(equalToConstant: 25),
            taskCheckmarkButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

//MARK: - Actions

extension ProjectTaskView {
    func checkmarkButtonTapped(task: Task) {
        delegate?.checkmarkButtonTapped(task: task)
    }
}
