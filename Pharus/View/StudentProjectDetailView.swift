//
//  StudentProjectDetailView.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit

class StudentProjectDetailView: UIView {
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .cardColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.mainView"
        
        return view
    }()
    
    lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentProjectDetailView.mainScrollView"
        
        return scrollView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.backgroundColor = .green
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.mainStackView"
        
        return stackView
    }()
    
    lazy var mentorLabel: UILabel = {
        let label = UILabel()
        label.text = "Mentor: José da Silva"
        label.font = .cardTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.mentorLabel"
        
        return label
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.descriptionStackView"
        
        return stackView
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição:"
        label.font = .cardSubtitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTitleLabel"
        
        return label
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. "
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.descriptionTextLabel"
        
        return label
    }()
    
    lazy var taskStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 29
        stackView.backgroundColor = .yellow
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"
        
        return stackView
    }()
    
    lazy var titleHelper: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProjectDetailView.taskStackView"
        
        return view
    }()
    
    lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lista de Tarefas"
        label.font = .cardSubtitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.taskTitleLabel"
        
        return label
    }()
    
    lazy var completedTasksLabel: UILabel = {
        let label = UILabel()
        label.text = "Completadas 3 de 4 tarefas"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProjectDetailView.completedTasksLabel"
        
        return label
    }()
    
    lazy var individualTaskHelperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .brown
        
        return stackView
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
        addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(mentorLabel)
        mainStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(descriptionTitleLabel)
        descriptionStackView.addArrangedSubview(descriptionTextLabel)
        
        mainStackView.addArrangedSubview(taskStackView)
        
        taskStackView.addArrangedSubview(titleHelper)
        titleHelper.addSubview(taskTitleLabel)
        
        taskStackView.addArrangedSubview(individualTaskHelperStackView)
        
        for _ in 1...30 {
            let individualTaskStackView = UIStackView()
            individualTaskStackView.translatesAutoresizingMaskIntoConstraints = false
            individualTaskStackView.axis = .horizontal
            individualTaskStackView.spacing = 11
            
            let taskTitleLabel = UILabel()
            taskTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            taskTitleLabel.text = "botao"
            taskTitleLabel.backgroundColor = .white
            
            
            let taskCheckboxButton = UIButton()
            taskCheckboxButton.layer.borderWidth = 1
            taskCheckboxButton.layer.borderColor = UIColor.black.cgColor
            taskCheckboxButton.layer.cornerRadius = 4
            taskCheckboxButton.backgroundColor = .systemPink
            taskCheckboxButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
            taskCheckboxButton.addAction(UIAction {  _ in
                print("teste")
            }, for: .touchUpInside)
            
            individualTaskStackView.addArrangedSubview(taskCheckboxButton)
            individualTaskStackView.addArrangedSubview(taskTitleLabel)
            
            individualTaskHelperStackView.addArrangedSubview(individualTaskStackView)
        }
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
        
        NSLayoutConstraint.activate([
            titleHelper.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            titleHelper.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            titleHelper.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
