//
//  itemIconView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/8/22.
//

import SwiftUI

struct ItemIconView: View {
    let category: String
    
    var body: some View {
        Image(category)
            .resizable()
            .frame(width: 75, height: 75)
            .cornerRadius(50)
            .overlay(Circle().stroke(lineWidth: 2))
    }
}


