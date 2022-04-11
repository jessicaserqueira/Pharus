//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//
import UIKit

class StudentProjectDetailViewController: UIViewController {
    
    var project: Project?
    var presenter: StudentProjectDetailPresenter?
    var customView = StudentProjectDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addActions()
    }
    
    override func loadView() {
        super.loadView()
        
        if let project = project {
            customView.customizeView(with: project)
            setupProjectTasks()
        }
        
        self.view = customView
    }
    
    func addActions() {
        customView.rulesHelperView.setOnClickListener {
            self.rulesViewTapped()
        }
        
        customView.uploadFilesButton.addAction(UIAction { _ in
            self.sendFilesButtonTapped()
        }, for: .touchUpInside)
    }
    
    func setupProjectTasks() {
        guard let project = project else { return }
        
        var completedTasksCount = 0
        
        for task in project.tasks {
            if task.isComplete {
                completedTasksCount += 1
            }
            
            let taskView = ProjectTaskViewView()
            taskView.customizeView(using: task)
            
            taskView.taskCheckboxButton.addAction(UIAction { _ in
                taskView.taskCheckboxButton.setImage(task.isComplete ? .none : .checkmarkImage,
                                                     for: .normal)
                task.toggleCompletionStatus()
            }, for: .touchUpInside)
            
            customView.taskHelperStackView.addArrangedSubview(taskView)
        }
        
        customView.completedTasksLabel.text = "Completadas \(completedTasksCount) de \(project.tasks.count)"
        
    }
    
    func setNavigationBar() {
        self.title = project?.name
        
        let userImage = UIImage(named: K.AssetsNames.userPicture) ?? UIImage()
        
        let userProfileButton = UserProfileButton()
        userProfileButton.image = userImage
        
        let userPictureBarButton = UIBarButtonItem()
        userPictureBarButton.customView = userProfileButton
        
        self.navigationItem.rightBarButtonItem = userPictureBarButton
        
        var backButtonImage = UIImage(named: K.AssetsNames.backButton)
        backButtonImage = backButtonImage?.withTintColor(UIColor(red: 0.153,
                                                                 green: 0.153,
                                                                 blue: 0.153,
                                                                 alpha: 1),
                                                         renderingMode: .alwaysOriginal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage,
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(backButtonPressed))
        
    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Implementar quando a tela de usuário estiver pronta
    @objc func profilePicTapped() {
        print("Profile Picture pressed")
    }
    
}

extension StudentProjectDetailViewController: StudentProjectDetailViewDelegate {
    func rulesViewTapped() {
        guard let project = project else { return }
        presenter?.showProjectRules(rules: project.rules)
    }
    
    func taskCheckmarkButtonTapped() {
        print("task pressed")
        //presenter?.toggleTaskCompletedStatus(task: <#T##Task#>)
    }
    
    func showTaskButtonTapped() {
        print("mostrar descricao")
    }
    
    func sendFilesButtonTapped() {
        presenter?.showUploadFileView()
    }
    
    
}

