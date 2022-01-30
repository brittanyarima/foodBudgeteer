//
//  CountdownCardView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/30/22.
//

import SwiftUI

struct CountdownCardView: View {
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                HStack {
                    Text("countdown")
                        .foregroundColor(ColorManager.purple)
                        .font(.headline)
                    Spacer()
                    
                    Button {
                        // Go to Edit TripDate
                        
                    } label: {
                        Image(systemName: "pencil.circle")
                    }
                }
                Spacer()
                
                // days til trip here
                Text("25")
                    .font(.system(size: 50).bold())
                    .foregroundColor(.white)
                Text("days til trip")
                    .font(.subheadline)
                    .foregroundColor(ColorManager.lightGrey)
                Spacer()
                
            }
            
        }
        .frame(width: 300, height: 150)
        .padding()
        .background(ColorManager.darkGrey)
        .cornerRadius(12)
    }
}

struct CountdownCardView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownCardView()
    }
}
