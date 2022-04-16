//
//  UserProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectsViewController: UIViewController {
    
    var presenter: StudentProjectsPresenter?
    var student: Student?
    var projects = [Project]()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        projects = student?.projects ?? [Project]()
        view.addSubview(tableView)
        setupTableView()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        let image = UIImage(named: "userPicture")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(profilePicTapped), for: .touchUpInside)

        self.title = "Seus projetos"
        
        let userImage = UIImage(named: K.Assets.Images.userImage)!
        let userProfileButtonView = createUserProfileButton(image: userImage)
        
        let userPictureBarButton = UIBarButtonItem()
        userPictureBarButton.customView = userProfileButtonView
        
        self.navigationItem.rightBarButtonItem = userPictureBarButton
        
        var backButtonImage = UIImage(named: K.Assets.Icons.backButtonIcon)
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
    
    //Implementar quando o fluxo estiver pronto
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
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

extension StudentProjectsViewController: StudentProjectCellDelegate {
    func projectTapped() {
        
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
        presenter?.showStudentProject(project: project)
    }
}
