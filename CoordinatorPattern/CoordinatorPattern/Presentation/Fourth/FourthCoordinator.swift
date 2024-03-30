//
//  FourthCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

protocol FourthCoordinatorType: CoordinatorType {}

final class FourthCoordinator: FourthCoordinatorType {
    
    var parent: ParentCoordinatorDelegate?
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    var flowType: CoordinatorFlowType { .first }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let fourthViewController = FourthViewController()
        self.navigationController.viewControllers = [fourthViewController]
    }
}


