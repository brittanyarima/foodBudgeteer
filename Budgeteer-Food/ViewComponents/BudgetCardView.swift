//
//  BudgetCardView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/20/22.
//

import SwiftUI
import CoreData

struct BudgetCardView: View {
    @EnvironmentObject var plan: Plan
    @EnvironmentObject var budget: Budget
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.budget, ascending: false)
    ]) var fetchedBudget: FetchedResults<PlanEntity>
    
    @Binding var budgetSheetIsShowing: Bool

    
    
    
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
                Text("\(plan.userBudget, format: .currency(code: "USD"))")
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
