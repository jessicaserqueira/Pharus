//
//  AvatarSelectionViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//
import UIKit

class AvatarSelectionViewController: UIViewController {
    
    // MARK: - Properties
    
    private var coordinator: AvatarSelectionCoordinator
    private var student: StudentModel
    private var customView: AvatarSelectionView
    private var avatarSelectionCollectionView: UICollectionView?
    
    //MARK: - Initializer
    
    init(
        coordinator: AvatarSelectionCoordinator,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
        self.customView = AvatarSelectionView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        
        setupCollectionView()
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
        showStudentAvatar()
    }
    
    //MARK: - Functions
    
    func setNavigationBar() {
        self.title = "Avatar"
        self.navigationController?.title = ""
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        
        avatarSelectionCollectionView = UICollectionView(
            frame: customView.mainStackView.frame,
            collectionViewLayout: layout
        )
        
        avatarSelectionCollectionView?.showsHorizontalScrollIndicator = false
        avatarSelectionCollectionView?.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: K.CellReuseIdentifiers.avatarSelection
        )
        
        avatarSelectionCollectionView?.backgroundColor = .clear
        
        avatarSelectionCollectionView?.dataSource = self
        avatarSelectionCollectionView?.delegate = self
        
        customView.avatarSelectionStackView.addArrangedSubview(
            avatarSelectionCollectionView ?? UICollectionView()
        )
        
        NSLayoutConstraint.activate([
            avatarSelectionCollectionView!.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    func showStudentAvatar() {
        customView.mainAvatarImageView.image = UIImage(
            named: "avatar" + student.avatar + K.Assets.Images.Avatar.FullImage.suffix
        )
    }
}

extension AvatarSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        UIImage.images.avatars.circleImage.avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: K.CellReuseIdentifiers.avatarSelection,
            for: indexPath
        )
        
        let avatarImage = UIImage.images.avatars.circleImage.avatars[indexPath.row]
        let avatarImageView = UIImageView(image: avatarImage)
        
        cell.addSubview(avatarImageView)
        return cell
    }
}

extension AvatarSelectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let newAvatar = UIImage.images.avatars.fullImage.avatars[indexPath.row]
        customView.mainAvatarImageView.image = newAvatar
        
        student.avatar = String(indexPath.row + 1)
    }
}

