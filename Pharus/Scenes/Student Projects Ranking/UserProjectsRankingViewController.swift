//
//  UserProjectsRankingViewController.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//

import UIKit

class UserRankingProjectsViewController: UIViewController {
    
    var coordinator: UserProjectsRankingCoordinator?
    let tableView = UITableView()
    var student: Student?
    var projects = [Project]()
    
    // MARK: - Properties
    
    let viewCustom = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        view.addSubview(tableView)
        setupTableView()
        
        student = Bundle.main.decode("Student.json")
        if let student = student {
            projects = student.projects
        }
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = viewCustom
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        self.title = "Seus Rankings"
        
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
        print("Back button pressed")
    }
    
    //Implementar quando a tela de usuário estiver pronta
    @objc func profilePicTapped() {
        print("Profile Picture pressed")
    }
    
    func setupTableView() {
        tableView.register(UserProjectRankingCell.self,
                           forCellReuseIdentifier: K.CellReuseIdentifiers.userRankingProjects)
        
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

extension UserRankingProjectsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        480
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.userRankingProjects,
                                                 for: indexPath) as! UserProjectRankingCell
        let project = projects[indexPath.row]
        
        cell.configureSubviews()
        cell.setupConstraints()
        cell.configureCell(using: project)
        cell.mainView.layer.cornerRadius = 16
        
        return cell
    }
}

extension UserRankingProjectsViewController: UITableViewDelegate {
    
}

