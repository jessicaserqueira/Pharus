//
//  StudentProfileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StutentProfileViewController: UIViewController {
    
    //MARK: - Properties
    
    private var coordinator: StudentProfileCoordinator
    private var studentProfileView: StudentProfileView
    private var presenter: StudentProfilePresenter
    private var student: StudentModel
    
    //MARK: - Initializer
    
    init(
        coordinator: StudentProfileCoordinator,
        presenter: StudentProfilePresenter,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.student = student
        
        studentProfileView =  StudentProfileView(student: student)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
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
    
    //MARK: - Actions
    
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
    
    @objc func logoutTapped() {
        presenter.showLogoutAlert()
    }
}
