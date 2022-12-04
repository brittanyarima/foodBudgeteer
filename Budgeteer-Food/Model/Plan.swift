//
//  Plan.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import CoreData

class Plan: ObservableObject {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.name, ascending: false)
    ]) var budgetItems: FetchedResults<PlanEntity>
    
    @Published var items = [Menu]()
    
    // user budget input
    @Published var userBudget: Double = 100.00
        
    
    // remaining balace -- use on view
    var balance: Double {
        let budget = userBudget
        
        if total != 0 {
            return (budget - total)
        } else {
            return 0
        }
    }
    
//     add item prices -- use on view 
    var total: Double {
        if budgetItems.count > 0 {
            return budgetItems.reduce(0) { $0 + Double($1.price ?? "0.00")! }
        } else {
            return 0
        }
    }
    
    // add item to plan
    func add(item: [Menu]) {
        items.append(contentsOf: item)
    }

    // remove item from plan
    func remove(item: Menu) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    // calculate percent for chart and get string
    func getpercent(currentTotal: CGFloat, totalBudget: CGFloat) -> String {
        let per = currentTotal / totalBudget * 100
        
        return String(format: "%.1f", per)
    }
}
