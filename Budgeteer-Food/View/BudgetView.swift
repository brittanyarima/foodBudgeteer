//
//  BudgetView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI


struct BudgetView: View {
    
    @State private var budgetSheetIsShowing: Bool = false
    @State private var countdownSheetIsShowing: Bool = false
    @State private var updateBudget: String = ""

    
    @FetchRequest(
        entity: BudgetEntity.entity(),
        sortDescriptors: []
    ) var budgetItems: FetchedResults<BudgetEntity>
    
    
    
    
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
                ScrollView(.vertical) {
                    VStack {
                        BudgetCardView(budgetSheetIsShowing: $budgetSheetIsShowing)
                        
                        ChartCardView()
                        
                        CountdownCardView(countdownSheetIsShowing: $countdownSheetIsShowing)
                    }
                    .navigationTitle("myBudget")
                    .sheet(isPresented: $budgetSheetIsShowing, onDismiss: nil) {
                        EditBudgetView()
                    }
                    .sheet(isPresented: $countdownSheetIsShowing, onDismiss: nil) {
                        EditCountdownView()
                    }
                    
                    
                    
                }
            }
            
        }
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
            .environmentObject(Plan())
    }
}
