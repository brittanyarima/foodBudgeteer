//
//  PlanTotalView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/10/22.
//

import SwiftUI


struct PlanTotalView: View {
    @EnvironmentObject var plan: Plan
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.total, ascending: false)
    ]) var items: FetchedResults<PlanEntity>

    
    var body: some View {
        VStack {
            Text(items.first?.total ?? 0.00, format: .currency(code: "USD"))
                .font(.system(size: 38, weight: .bold, design: .default))
                .fontWeight(.bold)
                .foregroundColor(ColorManager.purple)
            
            Text("spent")
                .font(.headline)
                .foregroundColor(ColorManager.lightGrey)
        }
    }
}

