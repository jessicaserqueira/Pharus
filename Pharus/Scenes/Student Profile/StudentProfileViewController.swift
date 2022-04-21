//
//  StudentProfileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StutentProfileViewController: UIViewController {
    
    var coordinator: StudentProfileCoordinator
    var studentProfileView: StudentProfileView
    var presenter: StudentProfilePresenter
    var student: Student
    
    init(
        coordinator: StudentProfileCoordinator,
        presenter: StudentProfilePresenter,
        student: Student
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.student = student
        
        studentProfileView =  StudentProfileView(student: student)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = studentProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
        showStudentAvatar()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showStudentAvatar() {
        studentProfileView.profileImageView.image = UIImage(
            named: "avatar" + student.avatar + K.Assets.Images.Avatar.CircleImage.suffix
        )
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
        presenter.showLogoutAlert()
    }
}
