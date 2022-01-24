//
//  UnderlineTextFieldModifier.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/23/22.
//

import SwiftUI

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(ColorManager.purple)
            .padding(10)
    }
}
