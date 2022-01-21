//
//  EditBudgetView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/20/22.
//

import SwiftUI

struct EditBudgetView: View {
    var body: some View {
        VStack {
            Text("Edit Budget")
        }
    }
}

struct EditBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        EditBudgetView()
            .environmentObject(Plan())
    }
}
