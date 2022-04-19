//
//  StudentAvatar.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

protocol AvatarSelectionDelegate: AnyObject{
    
    func selectYourAvatar()
}

class AvatarSelectionView: UIView {
    
    weak var delegate: AvatarSelectionDelegate?
    
    //MARK: - Views
    
    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentAvatarView.scrollView"
        
        return scrollView
    }()
        
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.avatarStackView"
        
        return stackView
    }()
    
    lazy var avatarScreenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.avatars.fullImage.avatar1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarScreenImageView"
        
        return imageView
    }()
    
    lazy var selectYourAvatarLabel: UILabel = {
        let label = UILabel()
        label.text = "Escolha o seu avatar"
        label.textAlignment = .center
        label.font = .largeTitleBold
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentAvatarView.selectYourAvatarLabel"
        
        return label
    }()
    
    lazy var avatarScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentAvatarView.scrollView"
        
        return scrollView
    }()
    
    lazy var avatarSelectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentAvatarView.avatarSelectionStackView"
        
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
        
        addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(avatarScreenImageView)
        mainStackView.addArrangedSubview(selectYourAvatarLabel)
        mainStackView.addArrangedSubview(avatarScrollView)
        
        avatarScrollView.addSubview(avatarSelectionStackView)
        
        for avatar in UIImage.images.avatars.circleImage.avatars {
            let avatarImage = UIImageView()
            avatarImage.image = avatar
                        
            avatarSelectionStackView.addArrangedSubview(avatarImage)
            avatarImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
            avatarImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        }
    }
    func setupConstraints() {
        
        self.stretch(mainScrollView)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        //Select Avatar Stack View
        self.stretch(avatarSelectionStackView, to: avatarScrollView)
        
        //Avatar Scroll View
        avatarScrollView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
extension AvatarSelectionView: AvatarSelectionDelegate {
    func selectYourAvatar() {
        delegate?.selectYourAvatar()
    }
}
