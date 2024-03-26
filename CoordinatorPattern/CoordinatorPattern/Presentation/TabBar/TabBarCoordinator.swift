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
    
}
