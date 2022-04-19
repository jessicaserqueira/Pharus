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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        self.view = viewCustom
        //viewCustom.backgroundColor = .blue
        viewCustom.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
    }
    
    func setNavigationBar() {
        self.title = "Avatar"
        self.navigationController?.title = ""
    }
    
    func setGradientBackground() {
        let colors = [
            UIColor(red: 0.235, green: 0.125, blue: 0.694, alpha: 1).cgColor,
            UIColor(red: 0.933, green: 0.298, blue: 0.557, alpha: 1).cgColor,
            UIColor(red: 0.918, green: 0.525, blue: 0.259, alpha: 1).cgColor
        ]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.4)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1.2)
        
        gradientLayer.bounds = view.bounds.insetBy(dx: -0.6 * view.bounds.size.width,
                                                   dy: -0.5 * view.bounds.size.height)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
extension AvatarSelectionViewController: AvatarSelectionDelegate {
    
    func selectYourAvatar() {
        
    }
}
