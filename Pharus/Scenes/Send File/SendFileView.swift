//
//  SendFileView.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

protocol SendFileDelegate: AnyObject {
    func uploadButtonTapped()
    func sendFileButtonTapped()
}

class SendFileView: UIView {
    
    //MARK: - Properties
    
    weak var delegate: SendFileDelegate?
    
    
    //MARK: - Views
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.modal.yellowBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.mainView"
       
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SendFileView.mainStackView"
        
        return stackView
    }()
    
    private lazy var titleHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.titleHelperView"
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enviar arquivos"
        label.font = .largeTitleBold
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.titleLabel"
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Aqui você pode enviar os arquivos exigidos para completar uma tarefa. Você pode enviar mais de um arquivo de uma vez, bastando selecionar todos os que deseja enviar. "
        label.textColor = .black
        label.font = .smallBody
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.descriptionLabel"
        
        return label
    }()
    
    private lazy var uploadFileHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.modal.orangeBackground
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.uploadFileHelperView"
        
        return view
    }()
    
    private lazy var uploadFileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setOnClickListener {
            self.uploadButtonTapped()
        }
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SendFileView.uploadFileStackView"
       
        return stackView
    }()
    
    private lazy var uploadIconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.uploadIconHelperView"
       
        return view
    }()
    
    private lazy var uploadIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.uploadIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "SendFileView.uploadIconImageView"
       
        return imageView
    }()
    
    
    private lazy var uploadMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Selecione os arquivos para enviar"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .smallBody
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.uploadMessageLabel"
        
        return label
    }()
    
    private lazy var fileHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SendFileView.fileView"
        
        return view
    }()
    
    private lazy var fileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "SendFileView.fileStackView"
       
        return stackView
    }()
    
    private lazy var fileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.bookIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "SendFileView.fileImageView"
        
        return imageView
    }()
    
    lazy var fileNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SendFileView.fileNameLabel"
        
        return label
    }()
    
    private lazy var removeFileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.icons.xmarkIcon, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "SendFileView.removeFileButton"
        
        return button
    }()
    
    private lazy var sendFileButton: MainCardButton = {
        let button = MainCardButton(title: "Enviar Arquivos", buttonState: .normal)
        button.addAction(UIAction { _ in
            self.sendFileButtonTapped()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "SendFileView.sendFileButton"
        
        return button
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    private func configureSubviews() {
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
    
    private func setupConstraints() {
        
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

//MARK: - Actions

extension SendFileView: SendFileDelegate {
    func uploadButtonTapped() {
        delegate?.uploadButtonTapped()
    }
    
    func sendFileButtonTapped() {
        delegate?.sendFileButtonTapped()
    }
}

