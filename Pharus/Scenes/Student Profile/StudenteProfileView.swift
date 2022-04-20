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
    
    convenience init(student: Student) {
        self.init()
        
        configureSubviews(with: student)
        setupConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews(with student: Student) {
        addSubview(mainView)
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(imageStackView)
        imageStackView.addArrangedSubview(profileImageView)
        
        let studentInfo: KeyValuePairs<String, String> = [
            "Nome": student.firstName + student.lastName,
            "E-mail": student.email,
            "Escola": student.school,
            "Período Escolar": student.year,
            "Cidade": student.city
        ]
        
        for info in studentInfo {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 18
            
            let infoKeyLabel = UILabel()
            infoKeyLabel.text = info.key
            infoKeyLabel.font = .mediumTitleBold
            
            let infoValueLabel = UILabel()
            infoValueLabel.text = info.value
            infoValueLabel.font = .smallBody
            
            stackView.addArrangedSubview(infoKeyLabel)
            stackView.addArrangedSubview(infoValueLabel)
            
            mainStackView.addArrangedSubview(stackView)
        }
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
