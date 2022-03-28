//
//  LoginView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject{
    
    
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "LoginView.mainView"
        
        return view
    }()
    
    lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.loginTitle"
       
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        backgroundColor = .white
        addSubview(mainView)
        mainView.addSubview(loginTitle)
    }
    
 
    
}
