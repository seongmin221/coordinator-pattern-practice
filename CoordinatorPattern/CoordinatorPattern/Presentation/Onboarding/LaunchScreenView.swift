//
//  LaunchScreenView.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/30/24.
//

import UIKit

final class LaunchScreenView: UIView {
    
    weak var viewDelegate: LaunchScreenViewDelegate?
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "launch screen view controller"
        label.textColor = .systemBlue
        return label
    }()
    private let showTabButton: UIButton = {
        let button = UIButton()
        button.setTitle("show tabbar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setUI()
        self.setLayout()
        self.setButtonActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        self.addSubview(showTabButton)
        showTabButton.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setButtonActions() {
        showTabButton.addAction(UIAction { [weak self] _ in
            guard let self else { return }
            self.viewDelegate?.showTabButtonTapped()
        }, for: .touchUpInside)
    }
}
