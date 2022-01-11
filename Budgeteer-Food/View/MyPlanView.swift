//
//  MyPlanView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI

struct MyPlanView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var plan: Plan
    @FetchRequest(sortDescriptors: [SortDescriptor(\.category)]) var items: FetchedResults<PlanEntity>
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]
    }
    //MARK: - BODY
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                    ZStack {
                        HalfSheetView()
                        
                        VStack {
                            Spacer()
                            
                            // current total
                            PlanTotalView()
                            ScrollView(.vertical) {
                                
                                List {
                                    ForEach(items) { item in
                                        ListItemView(icon: item.category ?? "Unknown Category", title: item.name ?? "Unknown Name", subtitle: item.restaurant ?? "Unknown Restaurant", price: item.price ?? "Unknown Price")
                                    }
                                    
                                }
                                
                            } //: SCROLL
                        } //: VSTACK
                    } //: ZSTACK
                
            } //: GEO
            .navigationTitle("myPlan")
        }
        .accentColor(ColorManager.purple)
        
    }
}

//MARK: - PREVIEW
struct MyPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlanView()
            .environmentObject(Plan())
    }
}
