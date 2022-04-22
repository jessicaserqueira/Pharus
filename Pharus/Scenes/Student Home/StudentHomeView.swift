//
//  StudentHomeView.swift
//  Pharus
//
//  Created by Victor Colen on 12/04/22.
//
import UIKit

class StudentHomeView: UIView {
    
    //MARK: - Properties
    
    private var studentName: String
    private let cards: [StudentHomeMiniCardView] = [
        StudentHomeMiniCardView(
            cardType: .warning,
            message: "\"Rabisco em arte\" termina em 6 dias!"
        ),
        StudentHomeMiniCardView(
            cardType: .newMedal,
            message: "O projeto \"Introdução a Robótica\" te deu uma medalha!"
        ),
        StudentHomeMiniCardView(
            cardType: .newProject,
            message: "Novo projeto: Algorítmo no seu dia"
        )
    ]
    
    //MARK: - Views
    
    private lazy var rectangleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rectangleImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentHomeView.rectangleImageView"
        return imageView
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentHomeView.mainScrollView"
        
        return scrollView
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.mainView"
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 49
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentHomeView.mainStackView"
        return stackView
    }()
    
    private lazy var helloStudentLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Antônia!"
        label.textColor = .white
        label.font = .largeTitleBold
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "StudentHomeView.helloStudentLabel"
        return label
    }()
    
    private lazy var studentAvatarHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.studentAvatarHelperView"
        return view
    }()
    
    lazy var studentAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.images.avatars.circleImage.avatar1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "StudentHomeView.studentAvatarImageView"
        return imageView
    }()
    
    private lazy var miniCardScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentHomeView.miniCardScrollView"
        return scrollView
    }()
    
    private lazy var miniCardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "StudentHomeView.miniCardStackView"
        return stackView
    }()
    
    private lazy var newsScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "StudentHomeView.newsScrollView"
        return scrollView
    }()
    
    lazy var newsHelperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.newsHelperView"
        return view
    }()
    
    private lazy var newsView: HomeNewsView = {
        let view = HomeNewsView()
        view.mainView.backgroundColor = .white
        view.mainView.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "StudentHomeView.newsView"
        return view
    }()
    
    //MARK: - Initializer
    
    convenience init(studentName: String) {
        self.init()
        
        self.studentName = studentName
        customizeSubviews()
    }
    
    override init(frame: CGRect) {
        
        studentName = "Antônia"
        
        super.init(frame: .zero)
        
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Subviews
    
    func configureSubviews() {
        addSubview(rectangleImageView)
        addSubview(mainScrollView)
        
        mainScrollView.addSubview(mainView)
        
        mainView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(helloStudentLabel)
        mainStackView.addArrangedSubview(studentAvatarHelperView)
        
        studentAvatarHelperView.addSubview(studentAvatarImageView)
        
        mainStackView.addArrangedSubview(miniCardScrollView)
        
        miniCardScrollView.addSubview(miniCardStackView)
        
        for card in cards {
            NSLayoutConstraint.activate([
                card.heightAnchor.constraint(equalToConstant: 180),
                card.widthAnchor.constraint(equalToConstant: 127)
            ])
            miniCardStackView.addArrangedSubview(card)
        }
        
        mainStackView.addArrangedSubview(newsHelperView)
        
    }
    
    private func customizeSubviews() {
        helloStudentLabel.text = "Olá, \(studentName)!"
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        
        //Main Scroll View
        self.stretch(mainScrollView)
        
        //Main View
        self.stretch(mainView, to: mainScrollView)
        
        //Main Stack View
        self.stretch(mainStackView, to: mainView, top: 80, bottom: -45)
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        //Main Stack View
        NSLayoutConstraint.activate([
            rectangleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rectangleImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rectangleImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 80),
            rectangleImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        //Student Avatar Helper View
        NSLayoutConstraint.activate([
            studentAvatarHelperView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        //Student Avatar Image View
        studentAvatarImageView.center(in: studentAvatarHelperView)
        NSLayoutConstraint.activate([
            studentAvatarImageView.heightAnchor.constraint(equalToConstant: 100),
            studentAvatarImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        //Mini Card Scroll View
        NSLayoutConstraint.activate([
            miniCardScrollView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        //Mini Card Stack View
        NSLayoutConstraint.activate([
            miniCardStackView.leadingAnchor.constraint(equalTo: miniCardScrollView.leadingAnchor),
            miniCardStackView.trailingAnchor.constraint(equalTo: miniCardScrollView.trailingAnchor)
        ])
        
        //News Helper View
        NSLayoutConstraint.activate([
            newsHelperView.heightAnchor.constraint(equalToConstant: 221)
        ])
    }
}
