//
//  ListItemView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/5/22.
//

import SwiftUI

struct ListItemView: View {
    //MARK: - PROPERTIES
    var icon: String
    var title: String
    var subtitle: String
    var price: String?
    var rightImage: String
    
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .center) {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 75)
                .padding(.all, 20)
            
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Text(subtitle)
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .foregroundColor(ColorManager.lightGrey)
                
                // MenuItem
                
                
                if price != nil {
                    HStack {
                        Text("$" + price!)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .padding(.top, 8)
                    }
                }
            }
            .padding(.trailing, 20)
            Spacer()
            
            Image(systemName: rightImage)
                .foregroundColor(ColorManager.purple)
                .font(.title2)
                .padding()
        
        
    }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(ColorManager.darkGrey)
        .modifier(CardModifier())
        .padding(.all, 10)
}
}

//MARK: - PREVIEW
struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(icon: "food",title: "Hamburger", subtitle: "Restaurant Name", price: "12.99", rightImage: "chevron.right")
    }
}
