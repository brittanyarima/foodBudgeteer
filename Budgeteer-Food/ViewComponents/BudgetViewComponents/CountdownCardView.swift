//
//  CountdownCardView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/30/22.
//

import SwiftUI

struct CountdownCardView: View {
    @Binding var countdownSheetIsShowing: Bool
    let date = Date()
    
    @FetchRequest(
        entity: BudgetEntity.entity(),
        sortDescriptors: []
    ) var budgetItems: FetchedResults<BudgetEntity>
    
    var dateFormatter: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return(formatter.string(from: budgetItems.first?.tripDate ?? date))
    }
    
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
                        countdownSheetIsShowing = true
                    } label: {
                        Image(systemName: "pencil.circle")
                    }
                }
                Spacer()
                
                // current trip date here
                Text(dateFormatter)
                    .foregroundColor(.white)
                    .font(.headline)

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

//struct CountdownCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountdownCardView()
//    }
//}
