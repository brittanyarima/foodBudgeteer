//
//  ChartView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI

struct ChartRingView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var plan: Plan
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.total, ascending: false)
    ]) var planItems: FetchedResults<PlanEntity>
    
    @FetchRequest(
        entity: BudgetEntity.entity(),
        sortDescriptors: []
    ) var budgetItems: FetchedResults<BudgetEntity>

    var total: Double {
        if planItems.count > 0 {
            return planItems.reduce(0) { $0 + Double($1.price ?? "0.00")! }
        } else {
            return 0
        }
    }
    
    // remaining balace -- use on view
    var balance: Double {
        let userBudget = Double(budgetItems.first?.budget ?? "0.00")!
        if total != 0 {
            return (userBudget - total)
        } else {
            return 0
        }
    }
    
    var budget: Double {
        let budgetDouble = Double(budgetItems.first?.budget ?? "0.00")!
        return budgetDouble
    }
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            
            // bottom ring
            Circle()
                .trim(from: 0, to: 1)
                .stroke(ColorManager.lightGrey, lineWidth: 10)
                .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
            
            // top ring
            Circle()
                .trim(from: 0, to: (total / budget))
                .stroke(ColorManager.purple, lineWidth: 10)
                .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
        }
        .rotationEffect(.init(degrees: -90))
    }
}

//MARK: - PREVIEW
struct ChartRingView_Previews: PreviewProvider {
    static var previews: some View {
        ChartRingView()
            .environmentObject(Plan())
    }
}
