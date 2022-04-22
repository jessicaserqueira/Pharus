//
//  HomeNewsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import UIKit

class HomeNewsViewController: UIViewController {
    
    //MARK: - Properties
    
    var page: Pages
    
    //MARK: - Initializer
    
    init(with page: Pages) {
        self.page = page
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        self.view = page.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
