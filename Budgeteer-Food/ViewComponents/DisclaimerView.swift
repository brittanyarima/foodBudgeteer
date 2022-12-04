//
//  DisclaimerView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/10/22.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(ColorManager.lightGrey)
            Text("Prices may not be exact. Please see final prices when you are at the parks.")
                .font(.italic(.caption)())
                .foregroundColor(ColorManager.lightGrey)
        }
        .padding(.horizontal)
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
            .environmentObject(Plan())
    }
}
