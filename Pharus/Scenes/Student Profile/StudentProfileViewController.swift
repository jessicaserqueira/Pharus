//
//  StudentProfileViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StutentProfileViewController: UIViewController {
    
    var coordinator: StudentProfileCoordinator
    var studentProfileView = StudentProfileView()
    var presenter: StudentProfilePresenter
    
    override func loadView() {
        super.loadView()
       
        self.view = studentProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentProfileView.delegate = self
        setNavigationBar()
        
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
        
        var logoutButtonImage = UIImage(named: K.Assets.Icons.logoutButtonIcon)
        logoutButtonImage = logoutButtonImage?.withTintColor(UIColor(red: 0.153,
                                                                     green: 0.153,
                                                                     blue: 0.153,
                                                                     alpha: 1),
                                                             renderingMode: .alwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: logoutButtonImage,
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(logoutButtonPressed))
        
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
        self.navigationController?.popViewController(animated: true)
    }
    
    //Implementar quando o fluxo estiver pronto
    @objc func logoutButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension StutentProfileViewController: StudentProfileDelegate {
  
    
}



