//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

protocol AppCoordinatorType: CoordinatorType {
    func showLaunchScreenFlow()
    func showMainFlow()
}

final class AppCoordinator: AppCoordinatorType {
    
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    var children: [CoordinatorType] = []
    var flowType: CoordinatorFlowType { .app }
    
    var navigationController: UINavigationController
    private var tabBarController: UITabBarController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLaunchScreenFlow()
    }
    
    func showLaunchScreenFlow() {
        let launchScreenCoordinator = LaunchScreenCoordinator(navigationController: self.navigationController)
        launchScreenCoordinator.start()
        launchScreenCoordinator.finishDelegate = self
        self.children = [launchScreenCoordinator]
    }
    
    func showMainFlow() {
        let tabs: [Tab] = Tab.allCases
        let tabNavigations: [UINavigationController] = tabs.map(makeTabNavigation)
        let tabBarController = makeTabBarController()
        
        self.tabBarController = tabBarController
        self.tabBarController?.setViewControllers(tabNavigations, animated: false)
        self.tabBarController?.selectedIndex = 0
        
        Array(zip(tabs, tabNavigations))
            .map { tab, navigation in makeTabCoordinator(type: tab, from: navigation) }
            .forEach { coordinator in
                coordinator.finishDelegate = self
                coordinator.start()
                children.append(coordinator)
            }
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        sceneDelegate.changeRootViewController(to: tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func didFinish(childCoordinator: CoordinatorType) {
        children = children.filter { $0.flowType != childCoordinator.flowType }
        navigationController.viewControllers.removeAll()
        
        switch childCoordinator.flowType {
        case .onboarding:
            showMainFlow()
        default:
            showLaunchScreenFlow()
        }
    }
}


// MARK: - Main Flow related funcs
extension AppCoordinator {
    
    private func makeTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.layer.borderColor = UIColor.systemGray.cgColor
        tabBarController.tabBar.layer.cornerRadius = 5
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().unselectedItemTintColor = .systemGray
        
        return tabBarController
    }
    
    private func makeTabCoordinator(type tab: Tab, from navigationController: UINavigationController) -> CoordinatorType {
        
        switch tab {
        case .first:
            return FirstCoordinator(navigationController: navigationController)
        case .second:
            return SecondCoordinator(navigationController: navigationController)
        }
    }
    
    private func makeTabNavigation(from tab: Tab) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = makeTabBarItem(from: tab)
        return navigationController
    }
    
    private func makeTabBarItem(from tab: Tab) -> UITabBarItem {
        return .init(title: tab.title, image: tab.image, tag: tab.rawValue)
    }
}
