//
//  FirstViewController.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit
import SnapKit

final class FirstViewController: UIViewController {
    
    private weak var coordinator: FirstCoordinatorType?
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "first view controller"
        label.textColor = .green
        return label
    }()
    private lazy var showThirdButton: UIButton = {
        let button = UIButton()
        button.setTitle("show third", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            guard let self else { return }
            self.coordinator?.toThird()
        }, for: .touchUpInside)
        return button
    }()
    
    init(coordinator: FirstCoordinatorType) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setUI()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    private func setLayout() {
        self.view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        self.view.addSubview(showThirdButton)
        showThirdButton.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
}
