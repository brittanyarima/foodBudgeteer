//
//  ItemDetailHeaderView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/8/22.
//

import SwiftUI

struct ItemDetailHeaderView: View {
    let item: String
    let price: String
    let category: String
    
    var body: some View {
        VStack {
            ItemIconView(category: category)
            // Item Name
            Text(item)
                .font(.system(size: 20, weight: .black, design: .default))
            .foregroundColor(ColorManager.purple)
            .padding(.horizontal, 10)
            
            Divider()
                .padding(.horizontal)
        
            // Item Price
            Text("$" + price)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
    }
}

