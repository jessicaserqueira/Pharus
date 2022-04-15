//
//  AlerViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//
import UIKit

class AlertViewController: UIViewController {
    
    private var alertView: AlertView
    
    init(alertView: AlertView) {
        self.alertView = alertView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = alertView
    }
}
