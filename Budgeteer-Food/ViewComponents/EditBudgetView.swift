//
//  EditBudgetView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/20/22.
//

import SwiftUI

struct EditBudgetView: View {
    @Binding var updatedBudget: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            // Title
            HStack {
                Text("Edit Budget")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                    .padding()
                
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .font(.largeTitle)
                        .foregroundColor(ColorManager.purple)
                }

            }
            .padding()
            Divider()
            
         
            VStack {
                Text("current budget")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(ColorManager.lightGrey)
                    
                // current budget
                Text("$5,321.00")
                    .font(.system(size: 44, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                    
                
            }
            .frame(width: 300, height: 175)
            .background(ColorManager.darkGrey)
            .cornerRadius(12)
            .padding(.top, 50)
            
            
           
            
            // Set new budget
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
//                    Text("set new budget")
                    
                    HStack {
                        Text("$")
                            .foregroundColor(ColorManager.purple)
                            .font(.system(size: 40, weight: .bold, design: .default))
                            
                        TextField("set budget...", text: $updatedBudget)
                            .font(.title)
                            .keyboardType(.decimalPad)
                    }
                    .underlineTextField()
                    .padding(.horizontal, 75)
                }
                .padding()
            }
           
            
            
            
            
            // Submit Button -- save to core data
            Button {
                // save to core data
                
                // dismiss view
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Text("Update")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(ColorManager.purple)
                    .cornerRadius(12)
            }
            Spacer()
        
        }
        .padding(.bottom)
        
            
    }
}

struct EditBudgetView_Previews: PreviewProvider {
  
    static var previews: some View {
       BudgetView()
            .environmentObject(Plan())
    }
}
