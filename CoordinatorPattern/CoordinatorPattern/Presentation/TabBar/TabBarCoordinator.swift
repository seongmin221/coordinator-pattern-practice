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



protocol TabBarCoordinatorType: CoordinatorType {
    var tabBarController: UITabBarController { get set }
    func toTab(_ tab: Tab)
}

final class TabBarCoordinator: TabBarCoordinatorType {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var children: [CoordinatorType] = []
    var flowType: CoordinatorFlowType { .tab }
    
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        let tabs: [Tab] = Tab.allCases.sorted(by: { $0.rawValue < $1.rawValue })
        let navigationControllers: [UINavigationController] = tabs
            .map { tab in createTabNavigation(with: tab) }
        
        self.tabBarController.setViewControllers(navigationControllers, animated: false)
        self.tabBarController.selectedIndex = Tab.first.rawValue
        self.navigationController.pushViewController(self.tabBarController, animated: false)
    }
    
    func end() {
        
    }
    
    func toTab(_ tab: Tab) {
        
    }
}

extension TabBarCoordinator {
    private func createTabNavigation(with tab: Tab) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(title: tab.title, 
                                                       image: tab.image,
                                                       tag: tab.rawValue)
        
        switch tab {
        case .first:
            let firstCoordinator = FirstCoordinator(navigationController: self.navigationController)
            firstCoordinator.finishDelegate = self
            firstCoordinator.start()
            self.children.append(firstCoordinator)
        case .second:
            let secondCoordinator = SecondCoordinator(navigationController: self.navigationController)
            secondCoordinator.finishDelegate = self
            secondCoordinator.start()
            self.children.append(secondCoordinator)
        }
        
        return navigationController
    }
}

extension TabBarCoordinator: CoordinatorFinishDelegate {
    func didFinish(childCoordinator: any CoordinatorType) {
        
    }
}
