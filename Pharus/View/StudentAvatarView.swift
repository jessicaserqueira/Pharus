//
//  StudentAvatar.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

protocol StudentAvatarDelegate: AnyObject{
    
    func selectYourAvatar()
}

class StudentAvatarView: UIView {
    
    weak var delegate: StudentAvatarDelegate?
    
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentAvatarView.mainView"
        
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.mainStackView"
        return stackView
    }()
    
    lazy var avatarScreemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"AvatarScreem")
//        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarScreemImageView"
        
        return imageView
    }()
    
    
    lazy var avatarStackTitle: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.frame(forAlignmentRect: .zero)
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.avatarStackTitle"
        return stackView
    }()
    
    
    lazy var selectYourAvatarLabel: UILabel = {
        let label = UILabel()
        label.text = "Escolha o seu avatar"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentAvatarView.selectYourAvatarLabel"
        
        return label
    }()
    
    lazy var selectAvatarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.selectAvatarStackView"
        
        return stackView
    }()
    
    lazy var avatarImage1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Avatar1.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarImage1"
        
        return imageView
    }()
    
    lazy var avatarImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Avatar2.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarImage2"
        
        return imageView
    }()
    
    lazy var avatarImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Avatar3.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarImage3"
        
        return imageView
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
        mainStackView.addSubview(avatarScreemImageView)
        
        mainStackView.addArrangedSubview(avatarStackTitle)
        
        avatarStackTitle.addArrangedSubview(selectYourAvatarLabel)
        avatarStackTitle.addArrangedSubview(selectAvatarStackView)
        
        selectAvatarStackView.addArrangedSubview(avatarImage1)
        selectAvatarStackView.addArrangedSubview(avatarImage2)
        selectAvatarStackView.addArrangedSubview(avatarImage3)
        
    }
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView, top: 16, left: 16, bottom: -16, right: -16)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
            
        ])
        
        //Avatar Screem Image View
        NSLayoutConstraint.activate([
            avatarScreemImageView.heightAnchor.constraint(equalToConstant: 300),
            avatarScreemImageView.widthAnchor.constraint(equalToConstant: 300),
            avatarScreemImageView.centerYAnchor.constraint(equalTo: mainStackView.centerYAnchor),
            avatarScreemImageView.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor)
            
        ])
        
        //Avatar Stack Title
        NSLayoutConstraint.activate([
            avatarStackTitle.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            avatarStackTitle.heightAnchor.constraint(equalToConstant: 170)
    
        ])
        
        //Select Avatar Stack View
        NSLayoutConstraint.activate([
            selectAvatarStackView.topAnchor.constraint(equalTo: avatarStackTitle.topAnchor, constant: 20)
            
        ])
        
    }
}
extension StudentAvatarView: StudentAvatarDelegate {
    func selectYourAvatar(){
        delegate?.selectYourAvatar()
    }
}
