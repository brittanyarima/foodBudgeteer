//
//  DisneyModel.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI

struct Parks: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let gradient: String
    let restaurants: [Restaurant]
    
}

struct Restaurant: Identifiable, Codable {
    let id: String
    let name: String
    let type: String
    let menu: [Menu]
    
}

struct Menu: Codable, Equatable {
    let item: String
    let description: String?
    let price: String
    let glassPrice: String?
    let allergyFriendlyOptions: String?
    let category: String
    
    var id: UUID {
            UUID()
        }
}
