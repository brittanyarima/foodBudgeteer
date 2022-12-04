//
//  GridView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/5/22.
//

import SwiftUI

struct GridView: View {
    //MARK: - PROPERTIES
    let parks: [Parks] = Bundle.main.decode("disneyWorldParks.json")
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    //MARK: - BODY
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(parks) { park in
                NavigationLink(destination: RestaurantView(parks: park)) {
                    Image(park.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                }
            }
        }
        .padding(.horizontal)
    }
}

//MARK: - PREVIEW
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(Plan())
    }
}
