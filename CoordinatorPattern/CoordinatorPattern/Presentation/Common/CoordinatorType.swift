//
//  CoordinatorType.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/13/24.
//

import UIKit

protocol CoordinatorType: AnyObject {
    
    var navigationController: UINavigationController { get }
    var children: [CoordinatorType] { get set }
    
    func start()
    func end()
}
