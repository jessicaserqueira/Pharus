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
//        let button = UIButton()
//        button.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
//        let color = UIColor(patternImage: UIImage(named: "userPicture")!)
//        button.backgroundColor = color
//        button.layer.cornerRadius = 0.5 * button.bounds.size.width
//        button.addAction(UIAction { _ in
//            self.profilePicTapped()
//        }, for: .touchUpInside)
//
//        let barButton = UIBarButtonItem()
//        barButton.customView = button
//
//        self.navigationItem.rightBarButtonItem = barButton
        let image = UIImage(named: "userPicture")?.withRenderingMode(.alwaysOriginal)
        //let imageView = UIImageView(image: image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(profilePicTapped))
        
        var backButtonImage = UIImage(named: K.AssetsNames.backButton)
        backButtonImage = backButtonImage?.withTintColor(UIColor(red: 0.153, green: 0.153, blue: 0.153, alpha: 1), renderingMode: .alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage,
                                                           style: .done,
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
        tableView.register(UserProjectCell.self, forCellReuseIdentifier: K.CellReuseIdentifiers.userProjects)
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
       // books.count
        projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.userProjects, for: indexPath) as! UserProjectCell
        let project = projects[indexPath.row]
        
//        let project = Project(name: "Meu primeiro projeto alo alo alo",
//                              score: 157,
//                              medal: "gold",
//                              projectDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus.",
//                              scoreDescription: "tirou essa nota p qsim ",
//                              startDate: "21/02/12", endDate: "22/02/12",
//                              rules: "regras e regras e regras",
//                              mentors: ["Fernando Sabino", "José oliveira da silva fernandes"])

        cell.configureSubviews()
        cell.setupConstraints()
        cell.configureCell(project: project)
        cell.mainView.layer.cornerRadius = 16
        
        return cell
    }
    
    
}

extension UserProjectsViewController: UITableViewDelegate {
    
}
