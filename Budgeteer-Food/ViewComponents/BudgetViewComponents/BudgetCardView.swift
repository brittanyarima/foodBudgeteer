//
//  BudgetCardView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/20/22.
//

import SwiftUI
import CoreData

struct BudgetCardView: View {
    @Binding var budgetSheetIsShowing: Bool
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.budget, ascending: false)
    ]) var budgetItems: FetchedResults<PlanEntity>
    
    
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("my budget")
                        .foregroundColor(ColorManager.purple)
                        .font(.headline)
                    Spacer()
                    
                    Button {
                        // Go to Edit Budget Sheet
                        self.budgetSheetIsShowing.toggle()
                    } label: {
                        Image(systemName: "pencil.circle")
                    }

                }
                Spacer()
                
                // Fetch User Budget here
                Text("$" + (budgetItems.first?.budget ?? "0.00"))
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .padding(.bottom, 50)
                
                
                
                
            }
            
        }
        .frame(width: 300, height: 150)
        .padding()
        .background(ColorManager.darkGrey)
        .cornerRadius(12)
        
    }
}

//struct BudgetCardView_Previews: PreviewProvider {
//    @State private var budgetSheetIsShowing: Bool = false
//    
//    static var previews: some View {
//        BudgetCardView(budgetSheetIsShowing: $budgetSheetIsShowing)
//            .environmentObject(Plan())
//            .environmentObject(Budget())
//    }
//}
