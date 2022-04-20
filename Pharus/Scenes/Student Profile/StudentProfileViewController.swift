//
//  StudentProfileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StutentProfileViewController: UIViewController {
    
    var coordinator: StudentProfileCoordinator
    var studentProfileView: StudentProfileView?
    var presenter: StudentProfilePresenter
    var student: Student?
    
    init(
        coordinator: StudentProfileCoordinator,
        presenter: StudentProfilePresenter,
        student: Student
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.student = student
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = studentProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let student = student {
            studentProfileView =  StudentProfileView(student: student)
        }
        setNavigationBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
    }
    
    init(
        coordinator: StudentProfileCoordinator,
        presenter: StudentProfilePresenter
    ){
        self.coordinator = coordinator
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNavigationBar() {
        self.title = "Perfil"
        self.navigationController?.title = ""
        
        let logoutIcon = UIImage.icons.logOutIcon?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: logoutIcon,
            style: .plain,
            target: self,
            action: #selector(logoutTapped)
        )
    }
    
    //MARK: - Implementar
    @objc func logoutTapped() {
        print("logout")
    }
}
