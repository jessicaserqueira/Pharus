//
//  UserProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class UserProjectsViewController: UIViewController {
    
    var coordinator: StartFlow?
    let tableView = UITableView()
  
       // MARK: - Properties
       
    let viewCustom = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNavigationBar()
        view.addSubview(tableView)
        setupTableView()
        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = viewCustom
        view.backgroundColor = .white
        
    }
    
    func setNavigationBar() {
        self.title = "Seus projetos"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        tableView.register(UserProjectCell.self, forCellReuseIdentifier: K.CellReuseIdentifiers.userProjects)
        tableView.dataSource = self
        tableView.delegate = self
        
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
        300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // books.count
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.userProjects, for: indexPath) as! UserProjectCell
        
        let project = Project(name: "Meu primeiro projeto",
                              score: 157,
                              medal: "gold",
                              projectDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus.",
                              scoreDescription: "tirou essa nota p qsim ",
                              startDate: "21/02/12", endDate: "22/02/12",
                              rules: "regras e regras e regras",
                              mentors: ["Fernando milp", "José oliveira"])

        cell.configureSubviews()
        cell.setupConstraints()
        cell.configureCell(project: project)
        cell.mainView.layer.cornerRadius = 16
        
        return cell
    }
    
    
}

extension UserProjectsViewController: UITableViewDelegate {
    
}
