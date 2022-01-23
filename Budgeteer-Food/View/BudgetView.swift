//
//  BudgetView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import HalfASheet

struct BudgetView: View {
    @EnvironmentObject var budget: Budget
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.name, ascending: false)
    ]) var budgetItems: FetchedResults<PlanEntity>
    
    @State private var budgetSheetIsShowing: Bool = false
    @State private var updateBudget: String = ""
    
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]
        
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ColorManager.background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    BudgetCardView(budgetSheetIsShowing: $budgetSheetIsShowing)
                }
                .navigationTitle("myBudget")
                .halfASheet(isPresented: $budgetSheetIsShowing, title: "Edit Budget") {
                    // Half Sheet View -- Edit Budget
                    EditBudgetView(updatedBudget: $updateBudget)
                    
                    
                } //: Half Sheet View
                
                
               
            }
          
        }
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
            .environmentObject(Budget())
            .environmentObject(Plan())
    }
}
