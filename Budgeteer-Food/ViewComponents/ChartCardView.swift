//
//  ChartCardView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI

struct ChartCardView: View {
//MARK: - PROPERTIES
    @EnvironmentObject var plan: Plan
    
    //MARK: - BODY
    var body: some View {
        HStack {
            
                ChartRingView()
            
            // TextView
            VStack(alignment: .leading) {
               
                
                // Spent
                HStack {
                        Rectangle()
                            .foregroundColor(ColorManager.purple)
                            .frame(width: 10, height: 10)
                            .cornerRadius(2)
                    VStack(alignment: .leading) {
                            Text(plan.total, format: .currency(code: "USD"))
                            .foregroundColor(.white)
                            .font(.title2)
                            Text("spent")
                                .foregroundColor(ColorManager.lightGrey)
                                .font(.caption)
                            
                        }

                
                    
                }
                // Remaining
                HStack {
                        Rectangle()
                            .foregroundColor(ColorManager.lightGrey)
                            .frame(width: 10, height: 10)
                            .cornerRadius(2)
                    VStack(alignment: .leading) {
                            Text(plan.balance, format: .currency(code: "USD"))
                            .foregroundColor(.white)
                            .font(.title2)
                            Text("remaining")
                                .foregroundColor(ColorManager.lightGrey)
                                .font(.caption)
                                
                        }
                        .padding(.top)
                }
            } //: TEXT
            .padding(.leading, 30)
            
        }
        .frame(width: 300, height: 150)
        .padding()
        .background(ColorManager.darkGrey)
        .cornerRadius(12)
        
    }
}

//MARK: - PREVIEW
struct ChartCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChartCardView()
            .environmentObject(Plan())
    }
}
