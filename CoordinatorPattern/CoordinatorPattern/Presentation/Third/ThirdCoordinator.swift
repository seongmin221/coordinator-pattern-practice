//
//  ThirdCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

protocol ThirdCoordinatorType: CoordinatorType {}

final class ThirdCoordinator: ThirdCoordinatorType {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    var flowType: CoordinatorFlowType { .first }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let thirdViewController = ThirdViewController()
        self.navigationController.viewControllers = [thirdViewController]
    }
}

