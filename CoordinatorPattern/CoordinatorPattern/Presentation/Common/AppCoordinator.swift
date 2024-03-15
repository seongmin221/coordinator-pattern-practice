//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

protocol AppCoordinatorType: CoordinatorType {
    func showOnboarding()
    func showTabBar()
}

final class AppCoordinator: AppCoordinatorType {
    
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        var needsOnboarding: Bool = true
        if needsOnboarding { showOnboarding() }
        else { showTabBar() }
    }
    
    func end() {
        
    }
    
    func showOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: self.navigationController)
        onboardingCoordinator.start()
        self.children = [onboardingCoordinator]
    }
    
    func showTabBar() {
        
    }
}
