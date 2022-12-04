//
//  ItemDetailModel.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/8/22.
//

import Foundation

class ItemDetailViewModel: ObservableObject {
    @Published var selectedItems = [Menu]()
    @Published var itemCount = 0
    
    // use this to when user taps + on stepper
    func add(item: Menu) {
        selectedItems.append(item)
    }
    
    // use this when user taps - on stepper
    func remove(item: Menu) {
        if let index = selectedItems.firstIndex(of: item) {
            selectedItems.remove(at: index)
        }
    }
    
    func reset() {
        selectedItems = []
        itemCount = 0
    }
    
    // total of selected items
    var itemsTotal: Double {
        if selectedItems.count > 0 {
            return selectedItems.reduce(0) { $0 + Double($1.price)! }
        } else {
            return 0
        }
    }
}
