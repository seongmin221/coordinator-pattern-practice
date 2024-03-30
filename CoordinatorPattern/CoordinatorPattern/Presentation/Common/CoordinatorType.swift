//
//  CoordinatorType.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/13/24.
//

import UIKit

enum CoordinatorFlowType {
    case app
    case tab, onboarding
    case first, second
}

protocol CoordinatorType: AnyObject {
    var parent: ParentCoordinatorDelegate? { get set }
    var navigationController: UINavigationController { get }
    var children: [CoordinatorType] { get set }
    var flowType: CoordinatorFlowType { get }
    
    func start()
    func finish()
}

extension CoordinatorType {
    func finish() {
        children.removeAll()
        parent?.finish(child: self)
    }
}

protocol ParentCoordinatorDelegate: AnyObject {
    func finish(child: CoordinatorType)
}
