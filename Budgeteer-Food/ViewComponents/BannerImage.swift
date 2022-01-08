//
//  BannerImage.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/6/22.
//

import SwiftUI

struct BannerImage: View {
    var body: some View {
        Image("foodBudgeteerHeader")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width - 50)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImage()
    }
}
