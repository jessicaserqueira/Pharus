//
//  StudentHomeViewController.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//
import UIKit

class StudentHomeViewController: UIViewController {
    
    private var coordinator: StudentHomeCoordinator
    private var presenter: StudentHomePresenter
    private var student: StudentModel
    private var pageController: UIPageViewController?
    private var currentIndex: Int
    private var pages: [Pages] = Pages.allCases
    
    let customView = StudentHomeView()
    
    init(
        coordinator: StudentHomeCoordinator,
        presenter: StudentHomePresenter,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.student = student
        self.currentIndex = 0
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarIcons()
        setupPageController()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground()
        showStudentAvatar()
    }
    
    func showStudentAvatar() {
        customView.studentAvatarImageView.image = UIImage(
            named: "avatar" + student.avatar + K.Assets.Images.Avatar.CircleImage.suffix
        )
    }
    
    func setupTabBarIcons() {
        let array = self.tabBarController?.customizableViewControllers
        for controller in array! {
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        }
    }
    
    private func setupPageController() {
        self.pageController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        
        self.customView.newsHelperView.addSubview(self.pageController!.view)
     
        self.view.stretch(self.pageController!.view, to: customView.newsHelperView, left: 16, right: -16)
        
        let initialVC = HomeNewsViewController(with: pages[0])
        
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true)
        self.pageController?.didMove(toParent: self)
    }
}

extension StudentHomeViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let currentVC = viewController as? HomeNewsViewController else {
                return nil
            }
            var index = currentVC.page.index
            if index == 0 {
                return nil
            }
            index -= 1
            let vc: HomeNewsViewController = HomeNewsViewController(with: pages[index])
            return vc
        }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let currentVC = viewController as? HomeNewsViewController else {
                return nil
            }
            var index = currentVC.page.index
            if index >= self.pages.count - 1 {
                return nil
            }
            index += 1
            let vc: HomeNewsViewController = HomeNewsViewController(with: pages[index])
            return vc
        }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
}

enum Pages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree
    
    var name: String {
        switch self {
        case .pageZero:
            return "This is page zero"
        case .pageOne:
            return "This is page one"
        case .pageTwo:
            return "This is page two"
        case .pageThree:
            return "This is page three"
        }
    }
    
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        }
    }
}
