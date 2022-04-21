//
//  StudentHomeViewController.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//
import UIKit

class StudentHomeViewController: UIViewController {
    
    private var coordinator: StudentHomeCoordinator
    private var presenter: StudentHomePresenter
    private var student: StudentModel
    let customView = StudentHomeView()
    
    init(
        coordinator: StudentHomeCoordinator,
        presenter: StudentHomePresenter,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.student = student
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarIcons()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
        showStudentAvatar()
    }
    
    func showStudentAvatar() {
        customView.studentAvatarImageView.image = UIImage(
            named: "avatar" + student.avatar + K.Assets.Images.Avatar.CircleImage.suffix
        )
    }
    
    func setupTabBarIcons() {
        let array = self.tabBarController?.customizableViewControllers
        for controller in array! {
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        }
    }
}
