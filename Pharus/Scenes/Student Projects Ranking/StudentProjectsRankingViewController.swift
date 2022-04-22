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
    private var student: StudentModel
    private var projects: [ProjectModel]
    
    init(
        coordinator: StudentProjectsRankingCoordinator,
        student: StudentModel
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
        
        tableView.backgroundColor = .clear
    }
    
    func setNavigationBar() {
        self.title = "Seus Rankings"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
    }
    
    func setupTableView() {
        tableView.register(StudentProjectRankingCell.self,
                           forCellReuseIdentifier: K.CellReuseIdentifiers.userRankingProjects)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        
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
        cell.backgroundColor = .clear
        
        return cell
    }
}

extension StudentRankingProjectsViewController: UITableViewDelegate {
    
}
