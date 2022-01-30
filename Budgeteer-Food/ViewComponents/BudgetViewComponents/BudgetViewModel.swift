//
//  BudgetViewModel.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/29/22.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var currentBudget: [String] = []
    
    
    func add(item: String) {
        currentBudget.append(item)
    }
    
 
    
}
