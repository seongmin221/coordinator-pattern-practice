//
//  Tabs.swift
//  CoordinatorPattern
//
//  Created by 이성민 on 3/30/24.
//

import UIKit

enum Tab: Int, RawRepresentable, CaseIterable {
    case first = 1
    case second = 2
    
    var title: String {
        switch self {
        case .first: return "first"
        case .second: return "second"
        }
    }
    
    var image: UIImage {
        switch self {
        case .first: return .init(systemName: "1.circle")!
        case .second: return .init(systemName: "2.circle")!
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .first: return .init(systemName: "1.circle.fill")!
        case .second: return .init(systemName: "2.circle.fill")!
        }
    }
}
