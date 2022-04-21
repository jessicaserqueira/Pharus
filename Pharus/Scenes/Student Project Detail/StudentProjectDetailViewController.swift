//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//
import UIKit

class StudentProjectDetailViewController: UIViewController {
    
    private var project: ProjectModel
    private var presenter: StudentProjectDetailPresenter
    private var coordinator: StudentProjectDetailCoordinator
    private var studentProjectDetailView: StudentProjectDetailView
    
    init(
        coordinator: StudentProjectDetailCoordinator,
        presenter: StudentProjectDetailPresenter,
        project: ProjectModel
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.project = project
        self.studentProjectDetailView = StudentProjectDetailView(project: project)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    override func loadView() {
        super.loadView()
        
        studentProjectDetailView.delegate = self
        self.view = studentProjectDetailView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
    }
    
    func setNavigationBar() {
        self.title = project.name
        
        var backButtonImage = UIImage(named: K.Assets.Icons.backArrowIcon)
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
}

extension StudentProjectDetailViewController: StudentProjectDetailViewDelegate {
    func envelopeIconTapped() {
        presenter.showMentorReview()
    }
    
    func taskCheckboxTapped(task: TaskModel) {
        presenter.toggleTaskCompletedStatus(task: task)
    }
    
    func rulesViewTapped() {
        presenter.showProjectRules(rules: project.rules)
    }
    
    func sendFilesButtonTapped() {
        presenter.showUploadFileView()
    }
}

