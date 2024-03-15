//
//  OnboardingViewController.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/13/24.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "onboarding view controller"
        label.textColor = .systemBlue
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

