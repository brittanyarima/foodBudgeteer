//
//  AddItemStepper.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/7/22.
//

import SwiftUI

struct AddItemStepper: View {
    @EnvironmentObject var itemDetail: ItemDetail
    let menuItem: Menu
    
 
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 125, height: 50)
                .foregroundColor(ColorManager.darkGrey)
            
            HStack {
                
                // plus button
                Button {
                    // increase stepper
                    itemDetail.itemCount += 1
                    itemDetail.add(item: menuItem)
                    
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(ColorManager.purple)
                        .font(.title2)
                }
                
                // stepper view
                Image(systemName: "\(itemDetail.itemCount).circle")
                    .font(.title)
                    .foregroundColor(ColorManager.purple)
                
                // minus button
                Button {
                    // decrease stepper
                    if itemDetail.itemCount != 0 {
                        itemDetail.itemCount -= 1
                        itemDetail.remove(item: menuItem)
                    }
                    
                } label: {
                    Image(systemName: "minus")
                        .foregroundColor(ColorManager.purple)
                        .font(.title2)
                }

            }
        }
    }
}

