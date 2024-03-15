//
//  OnboardingCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/13/24.
//

import UIKit

protocol OnboardingCoordinatorType: CoordinatorType {
    func toTabBar()
}

final class OnboardingCoordinator: OnboardingCoordinatorType {
    
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let onboardingViewController = OnboardingViewController()
        self.navigationController.viewControllers = [onboardingViewController]
    }
    
    func end() {
        
    }
    
    func toTabBar() {
        
    }
}
