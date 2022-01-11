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
                        ItemDetailHeaderView(item: menuItem.item, price: menuItem.price, category: menuItem.category)
                        
                        // Description & Allergy
                        Group {
                            if menuItem.description != nil {
                                ItemDescriptionVIew(headline: "Description", text: menuItem.description!)
                            } else {
                                ItemDescriptionVIew(headline: "Oh boy!", text: "There are no other details for this item.")
                            }
                            
                            if menuItem.allergyFriendlyOptions != nil {
                                ItemDescriptionVIew(headline: "Allergy-Friendly", text: menuItem.allergyFriendlyOptions! + "*Allergy options may not be exact. Please ask about options when you are at the parks.")
                            }
                        }
                        
                        
                        Spacer()
                        
                        Divider()
                            .padding(.horizontal)
                        // Add to plan
                        Group {
                            Text("Think you'll buy this in the parks?")
                                .font(.headline)
                                .foregroundColor(ColorManager.purple)
                                .padding(.bottom)
                            
                            HStack {
                                    AddItemStepper(menuItem: menuItem)
                                
                                // Add to plan button
                                Button {
                                    // add item to plan
                                    plan.add(item: itemDetail.selectedItems)
                                    itemDetail.reset()
                                    showingAddToPlanAlert.toggle()
                                    
                                    // save to core data
                                    let newItem = PlanEntity(context: moc)
                                    newItem.id = menuItem.id
                                    newItem.price = menuItem.price
                                    newItem.name = menuItem.item
                                    newItem.category = menuItem.category
                                    newItem.restaurant = restaurant.name
                                    newItem.total = plan.total
                                    try? moc.save()

                                    
                                    // show alert
                                } label: {
                                    ButtonView(text: "Add to Plan")
                                }
                                
                            }
                            
                        }
                        
                        Spacer(minLength: 75)
                        
                    }
                    .frame(height: geo.size.height - 100)
                    
                } //: ZSTACK
                .alert(isPresented: $showingAddToPlanAlert) {
                    Alert(title: Text("Added to plan"), message: Text("Item added to your plan."), dismissButton: .default(Text("OK")))
                }
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
