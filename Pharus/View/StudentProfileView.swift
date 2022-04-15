//
//  StudentProfileView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 14/04/22.
//
import UIKit

class StudentProfileView: UIView {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProfileView.mainView"
        
        return view
    }()

    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIScreen.main.bounds.height/17
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "LoginView.mainStackView"
        
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
    }
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView)
       
    }
    
}
