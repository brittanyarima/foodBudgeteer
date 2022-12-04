//
//  ChartCardView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import CoreData

struct ChartCardView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var plan: Plan
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: BudgetEntity.entity(),
        sortDescriptors: []
    ) var budgetItems: FetchedResults<BudgetEntity>
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.total
                         , ascending: false)
    ]) var planItems: FetchedResults<PlanEntity>

    var total: Double {
        if planItems.count > 0 {
            return planItems.reduce(0) { $0 + Double($1.price ?? "0.00")! }
        } else {
            return 0
        }
    }
    
    // remaining balace -- use on view
    var balance: Double {
        let userBudget = Double(budgetItems.first?.budget ?? "0")!
        if total != 0 {
            return (userBudget - total)
        } else {
            return 0
        }
    }

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
                        Text(total, format: .currency(code: "USD"))
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
                        Text(balance, format: .currency(code: "USD"))
                            .foregroundColor(.white)
                            .font(.title2)
                        Text("remaining")
                            .foregroundColor(ColorManager.lightGrey)
                            .font(.caption)
                    }
                    .padding(.top)
                }
            }
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
