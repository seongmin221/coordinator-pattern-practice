//
//  FirstCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

protocol FirstCoordinatorType: CoordinatorType {
    func toThird()
}

final class FirstCoordinator: FirstCoordinatorType {
    
    var parent: ParentCoordinatorDelegate?
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    var flowType: CoordinatorFlowType { .first }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController = FirstViewController(coordinator: self)
        self.navigationController.viewControllers = [firstViewController]
    }
    
    func toThird() {
        let thirdViewController = ThirdViewController()
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
}

