//
//  SendFileViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class SendFileViewController: UIViewController {

    let customView = SendFileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = customView
    }
}
