//
//  ItemDetailView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/6/22.
//

import SwiftUI

struct ItemDetailView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var plan: Plan
    @EnvironmentObject var itemDetail: ItemDetail
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAddToPlanAlert = false
    let menuItem: Menu
    let restaurant: Restaurant
    
    
    //MARK: - BODY
    var body: some View {
            
        GeometryReader { geo in
            ZStack {
                HalfSheetView()
                    
                    VStack {
                        Spacer()
                        
                        
                        VStack {
                            // Item Name
                            Text(menuItem.item)
                                .font(.system(size: 30, weight: .black, design: .default))
                            .foregroundColor(ColorManager.purple)
                        
                            // Item Price
                            Text("$" + menuItem.price)
                                .font(.system(size: 25, weight: .bold, design: .default))
                            
                            // Item stepper
                            AddItemStepper(menuItem: menuItem)
                            
                            // Item description
                            if menuItem.description != nil {
                                ItemDescriptionVIew(headline: "Description", text: menuItem.description!)
                            }
                            
                            // Allergy info
                            if menuItem.allergyFriendlyOptions != nil {
                                ItemDescriptionVIew(headline: "Allergy-Friendly Options", text: menuItem.allergyFriendlyOptions!)
                            }
                            
                    
                            
                            // Add to plan button
                            Button {
                                // add item to plan
                                plan.add(item: itemDetail.selectedItems)
                                print(plan.items)
                                // show alert
                            } label: {
                                ButtonView(text: "Add to Plan")
                            }

                        }
                        .frame(height: geo.size.height - 100)
                    
                } //: ZSTACK

            .navigationTitle("Item Details")
            .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}


//MARK: - PREVIEW
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Plan())
            .environmentObject(ItemDetail())
    }
}
