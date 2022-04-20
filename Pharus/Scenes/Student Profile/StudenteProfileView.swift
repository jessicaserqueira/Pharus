//
//  StudenteProfileView.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StudentProfileView: UIView {
    
    lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentProfileView.mainScrollView"
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProfileView.mainView"
        
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 88
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.mainStackView"
        
        return stackView
    }()
    
    lazy var profileImageHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProfileView.profileImageHelperView"
        
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.avatars.circleImage.avatar1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentProfileView.profileImageView"
        
        return imageView
    }()
    
    lazy var infoHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentProfileView.infoHelperView"
        return view
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentProfileView.infoStackView"
        return stackView
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
        addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(profileImageHelperView)
        
        profileImageHelperView.addSubview(profileImageView)
        
        mainStackView.addArrangedSubview(infoHelperView)
        
        infoHelperView.addSubview(infoStackView)
        
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
            
            infoStackView.addArrangedSubview(stackView)
        }
    }
    
    func setupConstraints() {
        //Main Scroll View
        self.stretch(mainScrollView)
          
        //Main Stack View
        self.stretch(mainStackView, to: mainScrollView, top: 30, bottom: -26)
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        //Info Helper View
        NSLayoutConstraint.activate([
            infoHelperView.heightAnchor.constraint(equalToConstant: 480)
        ])
        
        //Info Stack View
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: infoHelperView.leadingAnchor, constant: 40)
        ])
        
        //Profile Image Helper View
        NSLayoutConstraint.activate([
            profileImageHelperView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        //Profile Image View
        profileImageView.center(in: profileImageHelperView)
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
