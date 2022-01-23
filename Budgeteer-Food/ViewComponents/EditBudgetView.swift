//
//  EditBudgetView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/20/22.
//

import SwiftUI

struct EditBudgetView: View {
    @Binding var updatedBudget: String
    
    var body: some View {
        VStack {
            
           // Current budget goes here
            VStack {
                Text("$5,321.00")
                    .font(.system(size: 28, weight: .heavy, design: .default))
                Text("current budget")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(ColorManager.lightGrey)
                    .padding(.bottom, 100)
            }
            .padding(.top)
                
           
            
            // Set new budget
            Text("set new budget")
                .font(.system(size: 20, weight: .bold, design: .default))
           
            
            TextField("Set budget", text: $updatedBudget)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom)
                .frame(width: 300, height: 200, alignment: .center)
            
            // Submit Button -- save to core data
            Button {
                // save to core data
                
            } label: {
                Text("Update")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding()
                    .background(ColorManager.purple)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }

        
        }
        .padding()
    }
}

//struct EditBudgetView_Previews: PreviewProvider {
//    @State var updatedBudget: String = "100"
//    static var previews: some View {
//        EditBudgetView()
//            .environmentObject(Plan())
//    }
//}
