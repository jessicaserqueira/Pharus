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
}
