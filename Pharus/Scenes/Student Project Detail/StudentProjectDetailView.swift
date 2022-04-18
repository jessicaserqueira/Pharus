//
//  StudentProjectDetailView.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit

protocol StudentProjectDetailViewDelegate: AnyObject {
    func rulesViewTapped()
    func sendFilesButtonTapped()
}

class StudentProjectDetailView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: StudentProjectDetailViewDelegate?
    private var project: Project
    
    //MARK: - Views
    
    lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentProjectDetailView.mainScrollView"
        
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.modal.yellowModalBackground
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.mainView"
        
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.mainStackView"
        
        return stackView
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.titleStackView"
        return stackView
    }()
    
    lazy var mentorLabel: UILabel = {
        let label = UILabel()
        label.font = .largeTitleBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.mentorLabel"
        
        return label
    }()
    
    lazy var mentorReviewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.envelopeIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectDetailView.mentorReviewImageView"
        return imageView
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.descriptionStackView"
        
        return stackView
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .mediumTitleMedium
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTitleLabel"
        
        return label
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. "
        label.numberOfLines = 0
        label.font = .smallBody
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTextLabel"
        
        return label
    }()
    
    lazy var rulesHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.rulesHelperView"
        return view
    }()
    
    lazy var rulesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setOnClickListener {
            self.rulesViewTapped()
        }
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.rulesStackView"
        return stackView
    }()
    
    lazy var rulesBookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.bookIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProjectDetailView.rulesBoookImageView"
        return imageView
    }()
    
    lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Atividades do projeto"
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 4
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        label.textColor = UIColor.project.redText
        label.font = .largeTitleMedium
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionLabel"
        return label
    }()
    
    lazy var tasksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 29
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"
        
        return stackView
    }()
    
    lazy var tasksTitleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"
        
        return view
    }()
    
    lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lista de Tarefas"
        label.font = .mediumTitleSemiBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.taskTitleLabel"
        
        return label
    }()
    
    lazy var taskHelperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.individualTaskHelperStackView"
        
        return stackView
    }()
    
    lazy var completedTasksProgressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.completedTasksProgressStackView"
        
        return stackView
    }()
    
    lazy var completedTasksLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .smallTitleMedium
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.completedTasksLabel"
        
        return label
    }()
    
    lazy var completedTasksProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.layer.cornerRadius = 8
        progressView.progress = 0.75
        progressView.clipsToBounds = true
        progressView.trackTintColor = .white
        progressView.progressTintColor = UIColor.project.greenProgress
        progressView.accessibilityIdentifier = "StudentProjectDetailView.completedTasksProgressView"
        
        return progressView
    }()
    
    lazy var uploadFilesHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.uploadFilesHelperView"
        
        return view
    }()
    
    lazy var uploadFilesButton: MainCardButton = {
        let button = MainCardButton(title: "Enviar Arquivos")
        button.addAction(UIAction { _ in
            self.sendFilesButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "StudentProjectDetailView.uploadFilesButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    convenience init(project: Project) {
        self.init()
        
        self.project = project
        configureSubviews()
        customizeSubviews(with: project)
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        
        self.project = Student.defaultProject
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeSubviews(with project: Project) {
        mentorLabel.text = project.mentor
        descriptionTextLabel.text = project.projectDescription
        completedTasksProgressView.progress = project.completionStatus/100
        setupProjectTasks(of: project)
        
        if !project.isSubscribed {
            configureUnsubscribedProject(project)
        }
    }
    
    private func setupProjectTasks(of project: Project) {
        var completedTasksCount = 0
        
        for task in project.tasks {
            if task.isComplete {
                completedTasksCount += 1
            }
            
            let taskView = ProjectTaskView(
                task: task,
                checkImage: UIImage.icons.checkmarkIcon ?? .defaultImage,
                color: project.isSubscribed ? .black : .project.grayDisabledText
            )
            
            taskHelperStackView.addArrangedSubview(taskView)
        }
        
        completedTasksLabel.text = "Completadas \(completedTasksCount) de \(project.tasks.count) tarefas (\(project.completionStatus)%)"
        
    }
    
    private func configureUnsubscribedProject(_ project: Project) {
        mentorReviewImageView.image = mentorReviewImageView.image?.withTintColor(.project.grayDisabledText)
        rulesLabel.textColor = UIColor.project.grayDisabledText
        completedTasksLabel.textColor = UIColor.project.grayDisabledText
        taskTitleLabel.textColor = UIColor.project.grayDisabledText
        
        for case let taskView as ProjectTaskView in tasksStackView.arrangedSubviews {
            taskView.color = .project.grayDisabledText
        }
    }
    
    func configureSubviews() {
        addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleStackView)
        
        titleStackView.addArrangedSubview(mentorLabel)
        titleStackView.addArrangedSubview(mentorReviewImageView)
        
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(descriptionTitleLabel)
        descriptionStackView.addArrangedSubview(descriptionTextLabel)
        
        mainStackView.addArrangedSubview(rulesHelperView)
        
        rulesHelperView.addSubview(rulesStackView)
        
        rulesStackView.addArrangedSubview(rulesBookImageView)
        rulesStackView.addArrangedSubview(rulesLabel)
        
        mainStackView.addArrangedSubview(tasksStackView)
        
        tasksStackView.addArrangedSubview(tasksTitleHelperView)
        tasksTitleHelperView.addSubview(taskTitleLabel)
        
        tasksStackView.addArrangedSubview(taskHelperStackView)
        
        mainStackView.addArrangedSubview(completedTasksProgressStackView)
        
        completedTasksProgressStackView.addArrangedSubview(completedTasksLabel)
        completedTasksProgressStackView.addArrangedSubview(completedTasksProgressView)
        
        mainStackView.addArrangedSubview(uploadFilesHelperView)
        
        uploadFilesHelperView.addSubview(uploadFilesButton)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        
        //Scroll View
        self.stretch(mainScrollView)
        
        //Main View
        self.stretch(mainView, to: mainScrollView, top: 50, left: 16, bottom: -10, right: -16)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            mainStackView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor)
        ])
        
        //Mentor Review Image View
        NSLayoutConstraint.activate([
            mentorReviewImageView.widthAnchor.constraint(equalToConstant: 36),
            mentorReviewImageView.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        //Rules Stack Helper View
        NSLayoutConstraint.activate([
            rulesHelperView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //Rules Stack View
        rulesStackView.center(in: rulesHelperView)
        
        //Rules Book Image View
        NSLayoutConstraint.activate([
            rulesBookImageView.widthAnchor.constraint(equalToConstant: 24),
            rulesBookImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        //Tasks Title Helper
        NSLayoutConstraint.activate([
            tasksTitleHelperView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            tasksTitleHelperView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            tasksTitleHelperView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //Completed Tasks Progress View
        NSLayoutConstraint.activate([
            completedTasksProgressView.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        //Upload Files Helper View
        NSLayoutConstraint.activate([
            uploadFilesHelperView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Upload Files Button
        uploadFilesButton.center(in: uploadFilesHelperView)
        NSLayoutConstraint.activate([
            uploadFilesButton.widthAnchor.constraint(equalToConstant: 195)
        ])
    }
}

//MARK: - Actions

extension StudentProjectDetailView {
    func rulesViewTapped() {
        delegate?.rulesViewTapped()
    }
    
    func sendFilesButtonTapped() {
        delegate?.sendFilesButtonTapped()
    }
}
