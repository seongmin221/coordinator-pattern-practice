//
//  OnboardingViewController.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/13/24.
//

import UIKit
import Combine

import SnapKit

protocol LaunchScreenViewDelegate: AnyObject {
    func showTabButtonTapped()
}

final class LaunchScreenViewController: UIViewController {
    
    private weak var coordinator: LaunchScreenCoordinatorType?
    private let baseView: LaunchScreenView = .init()
    
    init(coordinator: LaunchScreenCoordinatorType) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setDelegate()
    }
    
    private func setView() {
        self.view = baseView
    }
    
    private func setDelegate() {
        self.baseView.viewDelegate = self
    }
}

extension LaunchScreenViewController: LaunchScreenViewDelegate {
    func showTabButtonTapped() {
        self.coordinator?.toTabBar()
    }
}
