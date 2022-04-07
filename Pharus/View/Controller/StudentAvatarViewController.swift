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
        let image = UIImage(named: "userPicture")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(image, for: .normal)
        
        
        self.title = "Avatar"
    }
   
}

extension StudentAvatarViewController: StudentAvatarDelegate {
    
    func selectYourAvatar(){
        
    }
}
