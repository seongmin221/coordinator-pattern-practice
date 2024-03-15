//
//  FirstCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

protocol FirstCoordinatorType {
    func toThird()
}

final class FirstCoordinator: FirstCoordinatorType {
    
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let onboardingViewController = FirstViewController()
        self.navigationController.viewControllers = [onboardingViewController]
    }
    
    func end() {
        
    }
    
    func toThird() {
        
    }
}

