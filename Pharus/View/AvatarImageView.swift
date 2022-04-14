//
//  AvatarImage.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 12/04/22.
//

import UIKit

class AvatarImageView: UIView {

    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "AvatarImageView.mainView"
        return view
    }()


    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentAvatarView.avatarImage1"
        
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
        mainView.addSubview(avatarImageView)

    }

    //MARK: - Constraints

    func setupConstraints() {
        self.stretch(mainView)
        
        //Main  View
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),

            
        ])
        

    }

}
