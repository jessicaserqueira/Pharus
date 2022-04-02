//
//  UserProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class UserProjectsViewController: UIViewController {
    
    var coordinator: UserProjectsCoordinator?
    let tableView = UITableView()
    var student: Student?
    var projects = [Project]()
  
       // MARK: - Properties
       
    let viewCustom = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNavigationBar()
        view.addSubview(tableView)
        setupTableView()
        student = Bundle.main.decode("Student.json")
        if let student = student {
            projects.append(contentsOf: student.schoolProjects)
            projects.append(contentsOf: student.companyProjects)
        }
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = viewCustom
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
        
        let p = UIBarButtonItem()
        p.customView = button
        navigationItem.rightBarButtonItem = p
        
        
        var backButtonImage = UIImage(named: K.AssetsNames.backButton)
        backButtonImage = backButtonImage?.withTintColor(UIColor(red: 0.153,
                                                                 green: 0.153,
                                                                 blue: 0.153,
                                                                 alpha: 1),
                                                         renderingMode: .alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backButtonPressed))
        
        self.title = "Seus projetos"
    }
    
    @objc func backButtonPressed() {
        print("Back button pressed")
    }
    
    @objc func profilePicTapped() {
    print("Profile Picture pressed")
   }
    
    func setupTableView() {
        tableView.register(UserProjectCell.self,
                           forCellReuseIdentifier: K.CellReuseIdentifiers.userProjects)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorColor = .clear
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension UserProjectsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        397
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.userProjects,
                                                 for: indexPath) as! UserProjectCell
        let project = projects[indexPath.row]
        
        cell.configureSubviews()
        cell.setupConstraints()
        cell.configureCell(project: project)
        cell.mainView.layer.cornerRadius = 16
        
        return cell
    }
}

extension UserProjectsViewController: UITableViewDelegate {
    
}
