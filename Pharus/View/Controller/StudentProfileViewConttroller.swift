//
//  StudentProfileViewConttroller.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 14/04/22.
//

import UIKit

class StudentProfileViewController: UIViewController {
    
    private lazy var customView = StudentProfileView()
    var coordinator: StudentProfileFlow?
    var presenter: StudentProfilePresenter?
    var student: Student?
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
    }
    
    override func loadView() {
        super.loadView()
        
        
        self.view = customView
        
        view.backgroundColor = .white
        
    }
    
    func setNavigationBar() {
        
        self.title = "Perfil"
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
}

