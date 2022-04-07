//
//  StudentProjectDetailViewController.swift
//  Pharus
//
//  Created by Victor Colen on 05/04/22.
//

import UIKit

class StudentProjectDetailViewController: UIViewController {
    
    var coordinator: LoginCoordinator?
    var customView = StudentProjectDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = customView
        self.title = "Projeto 1"
        setNavigationBar()
        customView.rulesHelperView.setOnClickListener {
            self.present(ProjectRulesViewController(), animated: true)
        }
        
        customView.uploadFilesButton.addAction(UIAction { _ in
            self.present(SendFileViewController(), animated: true)
        }, for: .touchUpInside)
    }
    
    func setNavigationBar() {
        
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
    
    //Implementar quando o fluxo estiver pronto
    @objc func backButtonPressed() {
        print("Back button pressed")
    }
    
    //Implementar quando a tela de usuário estiver pronta
    @objc func profilePicTapped() {
        print("Profile Picture pressed")
    }
    
}
