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
        self.navigationController?.title = ""
    }
}
extension StudentAvatarViewController: StudentAvatarDelegate {
    
    func selectYourAvatar() {
        
    }
}
