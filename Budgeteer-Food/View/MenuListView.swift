//
//  MenuListView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/6/22.
//

import SwiftUI

struct MenuListView: View {
    let restaurant: Restaurant
    let park: Parks
    
    var body: some View {
        ZStack {
            ColorManager.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                ForEach(restaurant.menu, id: \.item) { menuItem in
                    NavigationLink(destination: ItemDetailView(menuItem: menuItem, restaurant: restaurant)) {
                        ListItemView(icon: menuItem.category, title: menuItem.item, subtitle: restaurant.name, price: menuItem.price, rightImage: "chevron.right")
                    }
                }
                DisclaimerView()
            }
        }
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Plan())
            .environmentObject(ItemDetailViewModel())
    }
}
