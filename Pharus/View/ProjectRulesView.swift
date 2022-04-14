//
//  ProjectRulesView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class ProjectRulesView: UIView {
    
    //MARK: - Views
    
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .Modal.modalBackgroundColor
        scrollView.layer.cornerRadius = 16
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "ProjectRulesView.scrollView"
        return scrollView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectRulesView.mainStackView"
        
        return stackView
    }()
    
    lazy var titleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ProjectRulesView.titleHelperView"
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Regras do Projeto"
        label.font = .cardTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectRulesView.titleLabel"
        return label
    }()
    
    lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget nulla lorem. Aenean nec urna bibendum, auctor orci in, euismod metus. Donec elementum purus hendrerit ante consequat, vitae hendrerit neque tempus. Duis porta hendrerit ligula, eget pharetra magna rutrum sed. Vestibulum dignissim odio lectus, vitae vehicula odio dapibus ut. Integer id ex id ante volutpat cursus. Fusce urna dolor, varius euismod mi et, mollis elementum est. Nunc tincidunt mauris vitae turpis imperdiet, vel vestibulum lorem hendrerit. Vivamus quis urna pharetra, convallis lectus vel, volutpat felis. Donec dapibus pretium erat, in porttitor neque pharetra id. Quisque cursus tincidunt lectus sed blandit. Fusce ac ante eget ante malesuada mollis vitae a nisl."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectRulesView.rulesLabel"
        return label
    }()
    
    lazy var closeButton: MainCardButton = {
        let button = MainCardButton()
        button.setTitle("Fechar", for: .normal)
        return button
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
        addSubview(scrollView)
        
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleHelperView)
        
        titleHelperView.addSubview(titleLabel)
        
        mainStackView.addArrangedSubview(rulesLabel)
        mainStackView.addArrangedSubview(closeButton)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        self.stretch(scrollView)
        
        self.stretch(mainStackView, to: scrollView, top: 32, left: 25, bottom: -24, right: -25)
        mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        //Title Helper View
        NSLayoutConstraint.activate([
            titleHelperView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        //Title Label
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleHelperView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleHelperView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}
