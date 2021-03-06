//
//  ProjectScheduleView.swift
//  Pharus
//
//  Created by Victor Colen on 17/04/22.
//

import UIKit

class ProjectScheduleView: UIView {
    
    //MARK: - Properties
    var project: ProjectModel {
        didSet {
            customizeSubviews()
        }
    }
    
    //MARK: - Views
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ProjectScheduleView.mainView"
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "ProjectScheduleView.mainStackView"
        
        return stackView
    }()
    
    private lazy var iconHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "ProjectScheduleView.iconHelperView"
        
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.icons.clockIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "ProjectScheduleView.iconImageView"
        
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "20 dias"
        label.font = UIFont.mediumBodyBold
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "ProjectScheduleView.textLabel"
        
        return label
    }()
    
    
    //MARK: - Initilizer
    
    convenience init(project: ProjectModel) {
        self.init()
        
        self.project = project
        
        configureSubviews()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        
        self.project = StudentModel.defaultProject
        
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
        
        mainStackView.addArrangedSubview(iconHelperView)
        
        iconHelperView.addSubview(iconImageView)
        
        mainStackView.addArrangedSubview(textLabel)
    }
    
    private func customizeSubviews() {
        
        if project.isComplete {
            iconImageView.image = UIImage.icons.checkIcon?.withTintColor(.black)
            textLabel.text = "Feito!"
            mainView.backgroundColor = UIColor.projectSchedule.greenBackground
        } else {
            switch project.daysRemaining {
            case ..<0:
                mainView.backgroundColor = .black
                textLabel.text = "Expirado"
                iconImageView.image = UIImage.icons.xmarkIcon?.withTintColor(.white)
            case 0...6:
                mainView.backgroundColor = UIColor.projectSchedule.redBackground
                iconImageView.image = UIImage.icons.clockIcon ?? .defaultImage
                textLabel.text = "\(project.daysRemaining) Dias"
                textLabel.textColor = .white
                iconImageView.image = iconImageView.image?.withTintColor(.white)
            case 7...8:
                iconImageView.image = UIImage.icons.clockIcon ?? .defaultImage
                textLabel.text = "\(project.daysRemaining) Dias"
                mainView.backgroundColor = UIColor.projectSchedule.yellowBackground
            default:
                iconImageView.image = UIImage.icons.clockIcon ?? .defaultImage
                textLabel.text = "\(project.daysRemaining) Dias"
                mainView.backgroundColor = UIColor.projectSchedule.orangeBackground
            }
        }
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        //Main View
        self.stretch(mainView)
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, left: 10, right: -10)
        
        //Icon Helper View
        NSLayoutConstraint.activate([
            iconHelperView.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        //Icon Image View
        iconImageView.center(in: iconHelperView)
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 36),
            iconImageView.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
}
