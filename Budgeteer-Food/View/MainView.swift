//
//  MainView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import TabBar

struct MainView: View {
    @State private var selection: Item = .first
    @Environment(\.managedObjectContext) private var viewContext
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]
    }
    
    var body: some View {
       
            TabBar(selection: $selection) {
                    ContentView()
                        .tabItem(for: Item.first)
                
                
                    MyPlanView()
                        .tabItem(for: Item.second)
                
                    BudgetView()
                        .tabItem(for: Item.third)
                
                    SettingsView()
                        .tabItem(for: Item.fourth)
            
            }
            .tabBar(style: CustomTabBarStyle())
            .tabItem(style: CustomTabItemStyle())
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Plan())
            .environmentObject(ItemDetailViewModel())
    }
}
