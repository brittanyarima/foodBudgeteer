//
//  PlanTotalView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/10/22.
//

import SwiftUI
import CoreData


struct PlanTotalView: View {
    @EnvironmentObject var plan: Plan
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.name, ascending: false)
    ]) var budgetItems: FetchedResults<PlanEntity>

    var total: Double {
        if budgetItems.count > 0 {
            return budgetItems.reduce(0) { $0 + Double($1.price ?? "0.00")! }
        } else {
            return 0
        }
    }

    
    var body: some View {
        VStack {
            Text(total, format: .currency(code: "USD"))
                .font(.system(size: 38, weight: .bold, design: .default))
                .fontWeight(.bold)
                .foregroundColor(ColorManager.purple)
            
            Text("spent")
                .font(.headline)
                .foregroundColor(ColorManager.lightGrey)
        }
    }
}

