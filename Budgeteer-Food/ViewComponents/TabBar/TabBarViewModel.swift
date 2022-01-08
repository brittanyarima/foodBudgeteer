//
//  TabBarViewModel.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import TabBar

enum Item: Int, Tabbable {
    case first = 0
    case second
    case third
    case fourth
    
    var icon: String {
        switch self {
            case .first:  return "house"
            case .second: return "book"
            case .third:  return "dollarsign.circle"
            case .fourth: return "gear"
        }
    }
    
    var title: String {
        switch self {
            case .first: return "Home"
            case .second: return "Plan"
            case .third:  return "Budget"
            case .fourth: return "Settings"
        }
    }
}
