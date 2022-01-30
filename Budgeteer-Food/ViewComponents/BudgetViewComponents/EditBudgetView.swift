//
//  EditBudgetView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/20/22.
//

import SwiftUI

struct EditBudgetView: View {
    @EnvironmentObject var plan: Plan
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = BudgetViewModel()
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.budget, ascending: false)
    ]) var budgetItems: FetchedResults<PlanEntity>
    
    @State private var updatedBudget = ""
    
    //MARK: - FUNCTIONS
    
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            // find this item in our fetch request
            let item = budgetItems[offset]
            // delete it from the context
            moc.delete(item)
            
        }
        // save the context
        try? moc.save()
    }
    
    var total: Double {
        if budgetItems.count > 0 {
            return budgetItems.reduce(0) { $0 + Double($1.price ?? "0.00")! }
        } else {
            return 0
        }
    }
    
    var balance: Double {
        let userBudget = Double(budgetItems.first?.budget ?? "0")!
        if total != 0 {
            return (userBudget - total)
        } else {
            return 0
        }
    }
    
    //MARK: - BODY
    
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
                Text("$" + (budgetItems.first?.budget ?? "0.00"))
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
                // delete old budget??
                
                // save new budget to core data
                let newBudget = PlanEntity(context: moc)
                newBudget.budget = updatedBudget
                newBudget.balance = balance
                try? moc.save()
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
