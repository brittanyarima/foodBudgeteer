//
//  PlanTotalView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/10/22.
//

import SwiftUI

struct PlanTotalView: View {
    @EnvironmentObject var plan: Plan
    
    var body: some View {
        VStack {
            Text(plan.total, format: .currency(code: "USD"))
                .font(.system(size: 38, weight: .bold, design: .default))
                .fontWeight(.bold)
            .foregroundColor(ColorManager.purple)
            
            Text("spent")
                .font(.headline)
                .foregroundColor(ColorManager.lightGrey)
        }
    }
}

