//
//  StudentHomeViewController.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//
import UIKit

class StudentHomeViewController: UIViewController {
    
    private var coordinator: StudentHomeCoordinator
    private var presenter: StudentHomePresenter
    let customView = StudentHomeView()
    
    init(
        coordinator: StudentHomeCoordinator,
        presenter: StudentHomePresenter
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
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
