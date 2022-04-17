//
//  UserProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectsViewController: UIViewController {
    
    private var coordinator: StudentProjectsCoordinator
    private var presenter: StudentProjectsPresenter
    private var student: Student
    private var projects: [Project]
    let tableView = UITableView()
    
    init(
        coordinator: StudentProjectsCoordinator,
         presenter: StudentProjectsPresenter,
         student: Student
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.student = student
        self.projects = student.projects
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        view.addSubview(tableView)
        setupTableView()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        self.title = "Seus projetos"
        self.navigationController?.title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let image = UIImage(named: "userPicture")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(profilePicTapped), for: .touchUpInside)
        
        
        
        let userImage = UIImage(named: K.Assets.Images.userImage)!
        let userProfileButtonView = createUserProfileButton(image: userImage)
        
        let userPictureBarButton = UIBarButtonItem()
        userPictureBarButton.customView = userProfileButtonView
        
        self.navigationItem.rightBarButtonItem = userPictureBarButton
    }
    
    func createUserProfileButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(image, for: .normal)
        button.addTarget(self,
                         action: #selector(profilePicTapped),
                         for: .touchUpInside)
        
        return button
    }
        
    //Implementar quando a tela de usuário estiver pronta
    @objc func profilePicTapped() {
        print("Profile Picture pressed")
    }
    
    func setupTableView() {
        tableView.register(StudentProjectCell.self,
                           forCellReuseIdentifier: K.CellReuseIdentifiers.userProjects)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorColor = .clear
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension StudentProjectsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        397
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.userProjects,
                                                 for: indexPath) as! StudentProjectCell
        let project = projects[indexPath.row]
        
        cell.configureSubviews()
        cell.setupConstraints()
        cell.configureCell(using: project)
        cell.mainView.layer.cornerRadius = 16
        
        return cell
    }
}

extension StudentProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        presenter.showStudentProject(project: project)
    }
}
