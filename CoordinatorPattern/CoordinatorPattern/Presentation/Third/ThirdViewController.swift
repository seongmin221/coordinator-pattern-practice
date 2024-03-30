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
        label.textColor = .systemMint
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
    }
}

