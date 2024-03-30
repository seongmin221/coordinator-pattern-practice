//
//  OnboardingCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/13/24.
//

import UIKit

protocol LaunchScreenCoordinatorType: CoordinatorType {
    func toTabBar()
}

final class LaunchScreenCoordinator: LaunchScreenCoordinatorType {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    var flowType: CoordinatorFlowType { .onboarding }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LaunchScreenViewController(coordinator: self)
        self.navigationController.viewControllers = [viewController]
    }
    
    func toTabBar() {
        finishDelegate?.didFinish(childCoordinator: self)
    }
}
