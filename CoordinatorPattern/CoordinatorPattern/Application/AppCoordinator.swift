//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

enum TransitionStyle {
    case push
    case modal([UISheetPresentationController.Detent])
}

protocol CoordinatorType: AnyObject {
    
    var navigationController: UINavigationController { get }
    var children: [CoordinatorType] { get set }
    
    func start()
    func end()
}

protocol AppCoordinator {
    func showOnboarding()
    func showTabBar()
}

final class DefaultAppCoordinator: CoordinatorType {
    
//    enum Route {
//        case onboarding
//        case tabBar
//    }
//    var route: Route
    
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showTabBar()
//        switch route {
//        case .onboarding:
//            showOnboarding()
//        case .tabBar:
//            showTabBar()
//        }
    }
    
    func end() {
        <#code#>
    }
    
}

extension DefaultAppCoordinator: AppCoordinator {
    func showOnboarding() {
        // Onboarding이 있다면
    }
    
    func showTabBar() {
        let tabBarController = TabBarViewController()
    }
    
    
}
