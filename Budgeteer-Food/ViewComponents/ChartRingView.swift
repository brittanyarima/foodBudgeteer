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
                .trim(from: 0, to: (plan.total / plan.userBudget))
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
