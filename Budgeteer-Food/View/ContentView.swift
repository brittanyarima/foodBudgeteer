//
//  ContentView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \BudgetEntity.balance, ascending: true),NSSortDescriptor(keyPath: \BudgetEntity.budget, ascending: true)]
    ) private var budget: FetchedResults<BudgetEntity>
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]
    }
    
    //MARK: - BODY
    var body: some View {
            NavigationView {
                ZStack {
                    ColorManager.background
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    ScrollView(.vertical) {
                        VStack {
                            BannerImage()
                                .padding(.bottom, 20)
                            
                            
                            HeadlineTextView(icon: "dollarsign.circle", text: "my budget")
                            ChartCardView()
                                .padding(.bottom, 30)
                            
                            HeadlineTextView(icon: "sparkle.magnifyingglass", text: "explore restaurants by park")
                            
                            GridView()
                            Spacer()
                            
                        }
                    }
                }
                .navigationBarHidden(true)
            }
            .accentColor(ColorManager.purple)
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(Plan())
    }
}
