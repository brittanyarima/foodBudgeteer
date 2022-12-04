//
//  CustomTabBarItem.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import TabBar

struct CustomTabItemStyle: TabItemStyle {
    
    public func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        ZStack {
            if isSelected {
                Circle()
                    .foregroundColor(ColorManager.purple)
                    .frame(width: 40.0, height: 40.0)
            }
            Image(systemName: icon)
                .foregroundColor(isSelected ? .white : ColorManager.lightGrey)
                .frame(width: 32.0, height: 32.0)
        }
        .padding(.vertical, 8.0)
    }
}
