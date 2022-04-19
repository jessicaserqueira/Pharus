//
//  StudentRankingProjectsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 04/04/22.
//
import UIKit

class StudentRankingProjectsViewController: UIViewController {
    
    // MARK: - Properties
    
    let tableView = UITableView()
    private var coordinator: StudentProjectsRankingCoordinator
    private var student: Student
    private var projects: [Project]
    
    init(
        coordinator: StudentProjectsRankingCoordinator,
        student: Student
    ) {
        self.coordinator = coordinator
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
        
        student = Bundle.main.decode("Student.json")
        projects = student.projects
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        self.title = "Seus Rankings"
        self.navigationController?.title = ""
    }
    
    func setupTableView() {
        tableView.register(StudentProjectRankingCell.self,
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

extension StudentRankingProjectsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        502
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseIdentifiers.userRankingProjects,
                                                 for: indexPath) as! StudentProjectRankingCell
        let project = projects[indexPath.row]
        
        cell.configureCell(using: project)
        cell.mainView.layer.cornerRadius = 16
        
        return cell
    }
}

extension StudentRankingProjectsViewController: UITableViewDelegate {
    
}
