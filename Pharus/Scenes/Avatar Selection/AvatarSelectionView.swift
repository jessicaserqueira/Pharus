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
    
    lazy var avatarScreenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.avatars.fullImage.avatar1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarScreenImageView"
        
        return imageView
    }()
    
    lazy var expandButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.icons.expandIcon, for: .normal)
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
        
        mainStackView.addArrangedSubview(avatarScreenImageView)
        mainStackView.addArrangedSubview(expandButton)
        
        mainStackView.addArrangedSubview(avatarTitleView)
        avatarTitleView.addSubview(selectYourAvatarLabel)
        
        mainStackView.addArrangedSubview(avatarScrollView)
        avatarScrollView.addSubview(selectAvatarStackView)
        
        let images: [UIImage] = [
            .images.avatars.fullImage.avatar6 ?? .defaultImage,
            .images.avatars.fullImage.avatar7 ?? .defaultImage,
            .images.avatars.fullImage.avatar5 ?? .defaultImage
        ]
        
        for _ in 0...10 {
            let avatarImage = UIImageView()
            avatarImage.image = images.randomElement()!
                        
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
extension AvatarSelectionView: AvatarSelectionDelegate {
    func selectYourAvatar() {
        delegate?.selectYourAvatar()
    }
}
