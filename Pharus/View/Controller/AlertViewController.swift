//
//  AlerViewController.swift
//  Pharus
//
//  Created by Victor Colen on 07/04/22.
//

import UIKit

class AlertViewController: UIViewController {
    
    var alertView: AlertView? = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = alertView
    }
}
