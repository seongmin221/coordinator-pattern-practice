//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit
import SnapKit

final class ThirdViewController: UIViewController {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "third view controller"
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

