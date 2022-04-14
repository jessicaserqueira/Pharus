//
//  SendFileView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class SendFileView: UIView {
    
    //MARK: - Views
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .Project.subscribedProjectBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.mainView"
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SendFileView.mainStackView"
        return stackView
    }()
    
    lazy var titleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.titleHelperView"
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enviar arquivos"
        label.font = .cardTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.titleLabel"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus. "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.descriptionLabel"
        return label
    }()
    
    lazy var uploadFileHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = .Project.disabledProjectBackgroundColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.uploadFileHelperView"
        return view
    }()
    
    lazy var uploadFileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SendFileView.uploadFileStackView"
        return stackView
    }()
    
    lazy var uploadIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.uploadIconHelperView"
        return view
    }()
    
    lazy var uploadIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .uploadIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "SendFileView.uploadIconImageView"
        return imageView
    }()
    
    lazy var uploadMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Selecione os arquivos para enviar"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.uploadMessageLabel"
        return label
    }()
    
    lazy var fileHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.fileView"
        return view
    }()
    
    lazy var fileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SendFileView.fileStackView"
        return stackView
    }()
    
    lazy var fileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bookIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "SendFileView.fileImageView"
        return imageView
    }()
    
    lazy var fileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tarefa realizada.jpg"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.fileNameLabel"
        return label
    }()
    
    lazy var removeFileButton: UIButton = {
        let button = UIButton()
        button.setImage(.xmark, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "SendFileView.removeFileButton"
        return button
    }()
    
    lazy var sendFileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar arquivos", for: .normal)
        button.backgroundColor = UIColor(red: 0.765, green: 0.765, blue: 0.765, alpha: 1)
        button.layer.cornerRadius = 16
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "SendFileView.sendFileButton"
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
        addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleHelperView)
        
        titleHelperView.addSubview(titleLabel)
        
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(uploadFileHelperView)
        
        uploadFileHelperView.addSubview(uploadFileStackView)
        
        uploadFileStackView.addArrangedSubview(uploadIconHelperView)
        
        uploadIconHelperView.addSubview(uploadIconImageView)
        
        uploadFileStackView.addArrangedSubview(uploadMessageLabel)
        
        mainStackView.addArrangedSubview(fileHelperView)
        
        fileHelperView.addSubview(fileStackView)
        
        fileStackView.addArrangedSubview(fileImageView)
        fileStackView.addArrangedSubview(fileNameLabel)
        fileStackView.addArrangedSubview(removeFileButton)
        
        mainStackView.addArrangedSubview(sendFileButton)
    }
    
    //MARK: - Constraints
    
    func setupConstraints() {
        
        //Main View
        self.stretch(mainView)
        
        //Main Stack View
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 38),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25)
        ])
        
        //Title Helper View
        NSLayoutConstraint.activate([
            titleHelperView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        //Title Label
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleHelperView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleHelperView.centerYAnchor)
        ])
        
        //Upload File Helper View
        NSLayoutConstraint.activate([
            uploadFileHelperView.heightAnchor.constraint(equalToConstant: 118)
        ])
        
        //Upload File Stack View
        self.stretch(uploadFileStackView, to: uploadFileHelperView, top: 12, left: 37, bottom: -12, right: -37)
        
        //Upload Icon Helper view
        NSLayoutConstraint.activate([
            uploadIconHelperView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Upload Icon Image View
        NSLayoutConstraint.activate([
            uploadIconImageView.centerXAnchor.constraint(equalTo: uploadIconHelperView.centerXAnchor),
            uploadIconImageView.centerYAnchor.constraint(equalTo: uploadIconHelperView.centerYAnchor),
            uploadIconImageView.heightAnchor.constraint(equalToConstant: 43)
        ])
        
        //Send File Button
        NSLayoutConstraint.activate([
            sendFileButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        //File Helper View
        NSLayoutConstraint.activate([
            fileHelperView.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        //File Stack View
        self.stretch(fileStackView, to: fileHelperView, top: 9, left: 9, bottom: -9, right: -9)
        
        //File Image View
        fileImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        //Remove File button
        removeFileButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }
}
