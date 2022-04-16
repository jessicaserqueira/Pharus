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
        stackView.spacing = 32
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.mainStackView"
        
        return stackView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.stackView"
        
        return stackView
    }()
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"profile.fill")
        imageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProfileView.userImageView"
        
        return imageView
    }()
    
    lazy var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.nameStackView"
        
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.nameLabel"
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Antonia Ferreira"
        textField.font = .systemFont(ofSize: 14)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "StudentProfileView.nameTextField"
        
        return textField
    }()
    
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.emailStackView"
    
        return stackView
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.emailLabel"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "antonia.ferreira@gmail.com"
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "StudentProfileView.emailTextField"
        
        return textField
    }()
    
    lazy var schoolStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.schoolStackView"
    
        return stackView
    }()
    
    lazy var schoolLabel: UILabel = {
        let label = UILabel()
        label.text = "Escola"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.schoolLabel"
        
        return label
    }()
    
    lazy var schoolTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Escola Estadual João da Silva"
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "StudentProfileView.schoolTextField"
        
        return textField
    }()
    
    lazy var schoolYearStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.schoolYearStackView"
    
        return stackView
    }()
    
    lazy var schoolYearLabel: UILabel = {
        let label = UILabel()
        label.text = "Período Escolar"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.schoolYearLabel"
        
        return label
    }()
    
    lazy var schoolYearTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "7° ano"
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "StudentProfileView.schoolYearTextField"
        
        return textField
    }()
    
    lazy var cityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.cityStackView"
    
        return stackView
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Cidade"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentProfileView.cityLabel"
        
        return label
    }()
    
    lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Lavras, MG"
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "StudentProfileView.cityTextField"
        
        return textField
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
        mainStackView.addSubview(stackView)
        
        stackView.addArrangedSubview(userImageView)
        
        
        stackView.addArrangedSubview(nameStackView)
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)
        
        stackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        
        stackView.addArrangedSubview(schoolStackView)
        schoolStackView.addArrangedSubview(schoolLabel)
        schoolStackView.addArrangedSubview(schoolTextField)
        
        stackView.addArrangedSubview(schoolStackView)
        schoolStackView.addArrangedSubview(schoolLabel)
        schoolStackView.addArrangedSubview(schoolTextField)
        
        stackView.addArrangedSubview(schoolYearStackView)
        schoolYearStackView.addArrangedSubview(schoolYearLabel)
        schoolYearStackView.addArrangedSubview(schoolYearTextField)
        
        stackView.addArrangedSubview(cityStackView)
        cityStackView.addArrangedSubview(cityLabel)
        cityStackView.addArrangedSubview(cityTextField)
        
    }
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView)
        
 
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        //Stack View
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30),

        ])
        
        //User Image View
        NSLayoutConstraint.activate([
            userImageView.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 150)
           
        ])
}
}
