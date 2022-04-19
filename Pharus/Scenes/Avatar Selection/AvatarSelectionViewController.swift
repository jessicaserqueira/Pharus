//
//  AvatarSelectionViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//
import UIKit

class AvatarSelectionViewController: UIViewController {
    
    var coordinator: AvatarSelectionCoordinator?
    private lazy var viewCustom = AvatarSelectionView()
    
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
extension AvatarSelectionViewController: AvatarSelectionDelegate {
    
    func selectYourAvatar() {
        
    }
}
