//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//
import UIKit

class StudentProjectDetailViewController: UIViewController {
    
    var project: Project? = nil
    var presenter: StudentProjectDetailPresenter?
    var customView = StudentProjectDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        customView.rulesHelperView.setOnClickListener {
            let projectRulesViewController = ProjectRulesViewController()
            projectRulesViewController.project = self.project
            self.present(projectRulesViewController, animated: true)
        }
        
        customView.uploadFilesButton.addAction(UIAction { _ in
            self.present(SendFileViewController(), animated: true)
        }, for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        
        if let project = project {
            customView.customizeView(with: project)
        }
        
        self.view = customView
    }
    
    func setNavigationBar() {
        self.title = project?.name
        
        let userImage = UIImage(named: K.AssetsNames.userPicture) ?? UIImage()
        
        let userProfileButton = UserProfileButton()
        userProfileButton.image = userImage
        
        let userPictureBarButton = UIBarButtonItem()
        userPictureBarButton.customView = userProfileButton
        
        self.navigationItem.rightBarButtonItem = userPictureBarButton
        
        var backButtonImage = UIImage(named: K.AssetsNames.backButton)
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
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Implementar quando a tela de usuário estiver pronta
    @objc func profilePicTapped() {
        print("Profile Picture pressed")
    }
    
}

