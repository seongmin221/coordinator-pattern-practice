//
//  SecondCoordinator.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit

protocol SecondCoordinatorType: CoordinatorType {
    func toFourth()
}

final class SecondCoordinator: SecondCoordinatorType {
    
    var parent: ParentCoordinatorDelegate?
    var navigationController: UINavigationController
    var children: [CoordinatorType] = []
    var flowType: CoordinatorFlowType { .second }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondViewController = SecondViewController(coordinator: self)
        self.navigationController.viewControllers = [secondViewController]
    }
    
    func toFourth() {
        let fourthViewController = FourthViewController()
        self.navigationController.pushViewController(fourthViewController, animated: true)
    }
}

