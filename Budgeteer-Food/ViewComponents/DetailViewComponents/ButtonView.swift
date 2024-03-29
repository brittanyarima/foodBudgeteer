//
//  ButtonView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/7/22.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var itemDetail: ItemDetailViewModel
    let text: String

    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text("Total:")
                    .font(.subheadline)
                    .foregroundColor(ColorManager.purple)
                Text(itemDetail.itemsTotal, format: .currency(code: "USD"))
                    .foregroundColor(ColorManager.lightGrey)
                    .font(.subheadline)
            }

            ZStack {
                Capsule()
                    .frame(width: 150, height: 50)
                    .foregroundColor(ColorManager.darkGrey)

                HStack {
                    Image(systemName: "\(itemDetail.itemCount).circle")
                        .foregroundColor(ColorManager.purple)
                        .font(.title)
                    
                    Text(text)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .padding(.trailing, 2)
                }
            }
        }
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(itemCount: 1, text: "Add to Plan", totalAccumulated: 24.99)
//    }
//}
