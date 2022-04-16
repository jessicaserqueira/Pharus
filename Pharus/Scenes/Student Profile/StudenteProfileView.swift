//
//  StudenteProfileView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

protocol StudentProfileDelegate: AnyObject{
    
    
}

class StudentProfileView: UIView {
    
    weak var delegate: StudentProfileDelegate?
    
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
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.mainStackView"
        
        return stackView
    }()
    
    lazy var imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.imageStackView"
        
        return stackView
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.userImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "profileImageView.profileImageView"
        
        return imageView
    }()
    
    lazy var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.nameStackView"
        
        return stackView
    }()
    
    lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.nameTitleLabel"
        
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Antonia Ferreira"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.nameLabel"
        
        return label
    }()
    
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.emailStackView"
        
        return stackView
    }()
    
    lazy var emailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.emailTitleLabel"
        
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "antonia.ferreira@gmail.com"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.emailLabel"
        
        return label
    }()
    
    lazy var schoolStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.schoolStackView"
        
        return stackView
    }()
    
    lazy var schoolTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Escola"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.schoolTitleLabel"
        
        return label
    }()
    
    lazy var schoolLabel: UILabel = {
        let label = UILabel()
        label.text = "Escola Estadual João da Silva"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.emailLabel"
        
        return label
    }()
    
    lazy var schoolYearStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.schoolYearStackView"
        
        return stackView
    }()
    
    lazy var schoolYearTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Período Escolar"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.schoolYearTitleLabel"
        
        return label
    }()
    
    lazy var schoolYearLabel: UILabel = {
        let label = UILabel()
        label.text = "7° ano"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.schoolYearLabel"
        
        return label
    }()
    
    lazy var cityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.cityStackView"
        
        return stackView
    }()
    
    lazy var cityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cidade"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.cityTitleLabel"
        
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Lavras, MG"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.cityLabel"
        
        return label
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
        
        mainStackView.addArrangedSubview(imageStackView)
        imageStackView.addArrangedSubview(profileImageView)
        
        mainStackView.addArrangedSubview(nameStackView)
        nameStackView.addArrangedSubview(nameTitleLabel)
        nameStackView.addArrangedSubview(nameLabel)
        
        mainStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailTitleLabel)
        emailStackView.addArrangedSubview(emailLabel)
        
        mainStackView.addArrangedSubview(schoolStackView)
        schoolStackView.addArrangedSubview(schoolTitleLabel)
        schoolStackView.addArrangedSubview(schoolLabel)
        
        mainStackView.addArrangedSubview(schoolYearStackView)
        schoolYearStackView.addArrangedSubview(schoolYearTitleLabel)
        schoolYearStackView.addArrangedSubview(schoolYearLabel)
        
        mainStackView.addArrangedSubview(cityStackView)
        cityStackView.addArrangedSubview(cityTitleLabel)
        cityStackView.addArrangedSubview(cityLabel)
        
    }
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 40),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        
        //Image Stack View
        NSLayoutConstraint.activate([
            imageStackView.heightAnchor.constraint(equalToConstant: 120),
          
           
        ])
        
    }
}
