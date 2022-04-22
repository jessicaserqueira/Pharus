//
//  ProjectTaskView.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

protocol ProjectTaskDelegate: AnyObject {
    func checkmarkButtonTapped(task: TaskModel)
}

class ProjectTaskView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: ProjectTaskDelegate?
    private var checkImage: UIImage?
    private var task: TaskModel
    var color: UIColor
    
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
        label.font = .mediumTitleMedium
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
    
    //MARK: - Initializer
    
    convenience init(
        task: TaskModel,
        checkImage: UIImage,
        color: UIColor
    ) {
        self.init()
        
        self.task = task
        self.checkImage = checkImage
        self.color = color
        
        configureSubviews()
        customizeSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        
        self.task = TaskModel(
            title: "Tarefa",
            isComplete: false,
            description: "Lorem Ipsum"
        )
        
        self.color = .black
        
        self.checkImage = UIImage.icons.checkmarkIcon ?? .defaultImage
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    func configureSubviews() {
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(taskTitleStackView)
        
        taskTitleStackView.addArrangedSubview(taskCheckmarkButton)
        taskTitleStackView.addArrangedSubview(taskTitleLabel)
    }
    
    func customizeSubviews() {
        taskTitleLabel.text = task.title
        taskTitleLabel.textColor = color
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
    func checkmarkButtonTapped(task: TaskModel) {
        delegate?.checkmarkButtonTapped(task: task)
    }
}
