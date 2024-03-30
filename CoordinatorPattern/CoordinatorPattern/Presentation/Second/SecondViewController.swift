//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/12/24.
//

import UIKit
import SnapKit

final class SecondViewController: UIViewController {
    
    private weak var coordinator: SecondCoordinatorType?
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "second view controller"
        label.textColor = .brown
        return label
    }()
    private lazy var showFourthButton: UIButton = {
        let button = UIButton()
        button.setTitle("show fourth", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            guard let self else { return }
            self.coordinator?.toFourth()
        }, for: .touchUpInside)
        return button
    }()
    
    init(coordinator: SecondCoordinatorType) {
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
        
        self.view.addSubview(showFourthButton)
        showFourthButton.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
}

