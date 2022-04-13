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
    
    lazy var avatarScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentAvatarView.scrollView"
        
        return scrollView
    }()
    
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
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.avatarStackView"
        
        return stackView
    }()
    
    lazy var avatarScreemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"AvatarScreem")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarScreemImageView"
        
        return imageView
    }()
    
    lazy var expandButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Expand.fill"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 150, bottom: 0, right: 0)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "StudentAvatarView.expandButton"
       
        return button
    }()
    
    lazy var avatarTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentAvatarView.avatarTitleView"
        
        return view
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
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.selectAvatarStackView"
        
        return stackView
    }()
    
    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentAvatarView.scrollView"
        
        return scrollView
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
        
        addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(avatarScreemImageView)
        mainStackView.addArrangedSubview(expandButton)
        
        mainStackView.addArrangedSubview(avatarTitleView)
        avatarTitleView.addSubview(selectYourAvatarLabel)
        
        mainStackView.addArrangedSubview(avatarScrollView)
        avatarScrollView.addSubview(selectAvatarStackView)
        
        let images = [
            UIImage(named: "Avatar1"),
            UIImage(named: "Avatar2"),
            UIImage(named: "Avatar3"),
        ]
        
        for _ in 0...10 {
            let avatarImage = AvatarImageView()
            avatarImage.avatarImageView.image = images.randomElement()!
                        
            selectAvatarStackView.addArrangedSubview(avatarImage)
            avatarImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
            avatarImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        }
    }
    func setupConstraints() {

        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        //Avatar Title View
        NSLayoutConstraint.activate([
            avatarTitleView.heightAnchor.constraint(equalToConstant: 30),
            selectYourAvatarLabel.centerYAnchor.constraint(equalTo: avatarTitleView.centerYAnchor),
            selectYourAvatarLabel.centerXAnchor.constraint(equalTo: avatarTitleView.centerXAnchor),
        ])
        
        self.stretch(mainScrollView)
        self.stretch(selectAvatarStackView, to: avatarScrollView)
        avatarScrollView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
extension StudentAvatarView: StudentAvatarDelegate {
    func selectYourAvatar(){
        delegate?.selectYourAvatar()
    }
}
