//
//  StudentAvatarViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//
import UIKit

class StudentAvatarViewController: UIViewController {
    
    var coordinator: StudentAvatarCoordinator?
    private lazy var viewCustom = StudentAvatarView()
    
    // MARK: - Properties
    
    override func loadView() {
        super.loadView()
        
        self.view = viewCustom
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        self.view = viewCustom
        viewCustom.backgroundColor = .white
        viewCustom.delegate = self
        
        }
    
    func setNavigationBar() {
        
        self.title = "Avatar"
        var backButtonImage = UIImage(named: K.Assets.Icons.backButtonIcon)
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
}
extension StudentAvatarViewController: StudentAvatarDelegate {
    
    func selectYourAvatar(){
        
    }
}
