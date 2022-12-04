//
//  Budgeteer_FoodApp.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI

@main
struct Budgeteer_FoodApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var plan = Plan()
    @StateObject var itemDetail = ItemDetailViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(plan)
                .environmentObject(itemDetail)
        }
    }
}
