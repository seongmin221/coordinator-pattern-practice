//
//  TabBarCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

enum TransitionStyle {
    case push
    case modal([UISheetPresentationController.Detent])
}

enum Tab: Int, RawRepresentable, CaseIterable {
    case first = 1
    case second = 2
    
    var title: String {
        switch self {
        case .first: return "first"
        case .second: return "second"
        }
    }
    
    var image: UIImage {
        switch self {
        case .first: return .init(systemName: "1.circle")!
        case .second: return .init(systemName: "2.circle")!
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .first: return .init(systemName: "1.circle.fill")!
        case .second: return .init(systemName: "2.circle.fill")!
        }
    }
}

protocol TabBarCoordinatorType: CoordinatorType {
    var tabBarController: UITabBarController { get set }
    func toTab(_ tab: Tab)
}

final class TabBarCoordinator: TabBarCoordinatorType {
    
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    var tabBarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        
    }
    
    func end() {
        
    }
    
    func toTab(_ tab: Tab) {
        
    }
}

extension TabBarCoordinator {
    func createTabNavigationController(ofTab tab: Tab) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        tabNavigationController.setNavigationBarHidden(true, animated: false)
        tabNavigationController.tabBarItem = createTabBarItem(ofTab: tab)
        
    }
    
    func createTabBarItem(ofTab tab: Tab) -> UITabBarItem {
        return .init(
            title: tab.title,
            image: tab.image,
            selectedImage: tab.selectedImage
        )
    }
    
    func setTabNavigationController(ofTab tab: Tab) {
        switch tab {
        case .first:
            let firstCoordinator = FirstCoordinator(navigationController: self.navigationController)
            firstCoordinator.start()
        case .second:
            <#code#>
        }
    }
}


//final class TabBarController: UITabBarController {
//    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    private func configureTabBarItems() {
//        let tabs: [Tab] = Tab.allCases
//        let tabBarItems = tabs.map { createTabBarItem(of: $0) }
//        let tabBarController = tabs.map { UINavigationController(rootViewController: createTabBarControllers(of: $0)) }
//        
//    }
//}
//
//extension TabBarController {
//    private func createTabBarItem(of tab: Tab) -> UITabBarItem {
//        return .init(
//            title: "\(tab)",
//            image: .init(systemName: "\(tab).circle"),
//            selectedImage: .init(systemName: "\(tab).circle.fill")
//        )
//    }
//    
//    private func createTabBarControllers(of tab: Tab) -> UIViewController {
//        switch tab {
//        case .first: return FirstViewController()
//        case .second: return SecondViewController()
//        }
//    }
//}
