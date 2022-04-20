//
//  TwoBigButtonsAlertViewController.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class TwoBigButtonsAlertViewController: UIViewController {
    
    private var alertView = TwoBigButtonsAlertView()
    
//    init(
//        alertView: OneButtonAlertView,
//        coordinator: OneButtonAlertCoordinator,
//        presenter: OneButtonAlertPresenter
//    ) {
//
//        self.alertView = alertView
//        self.coordinator = coordinator
//        self.presenter = presenter
//
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = alertView
    }
}


