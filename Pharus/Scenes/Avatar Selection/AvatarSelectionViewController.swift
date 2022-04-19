//
//  AvatarSelectionViewController.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//
import UIKit

class AvatarSelectionViewController: UIViewController {
    
    var myCollectionView:UICollectionView?
    var coordinator: AvatarSelectionCoordinator?
    private var customView: AvatarSelectionView
    
    // MARK: - Properties
    
    init() {
        self.customView = AvatarSelectionView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    }
    
    func setNavigationBar() {
        self.title = "Avatar"
        self.navigationController?.title = ""
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumInteritemSpacing = 32
        layout.minimumLineSpacing = 32
        myCollectionView = UICollectionView(frame: customView.mainStackView.frame, collectionViewLayout: layout)
        myCollectionView?.showsHorizontalScrollIndicator = false
        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = .clear
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        customView.mainStackView.addArrangedSubview(myCollectionView ?? UICollectionView())
    }
}

extension AvatarSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        UIImage.images.avatars.circleImage.avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.addSubview(UIImageView(image: UIImage.images.avatars.circleImage.avatars[indexPath.row]))
        return myCell
    }
}

extension AvatarSelectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}

