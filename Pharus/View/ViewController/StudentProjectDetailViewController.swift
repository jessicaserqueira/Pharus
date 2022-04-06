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
        
    }
    
    func setNavigationBar() {
        
        let userImage = UIImage(named: K.AssetsNames.userPicture)!
        let userProfileButtonView = createUserProfileButton(image: userImage)
        
        let userPictureBarButton = UIBarButtonItem()
        userPictureBarButton.customView = userProfileButtonView
        
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
    
    func createUserProfileButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(image, for: .normal)
        button.addTarget(self,
                         action: #selector(profilePicTapped),
                         for: .touchUpInside)
        
        return button
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
