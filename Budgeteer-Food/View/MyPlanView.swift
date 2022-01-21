//
//  MyPlanView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/3/22.
//

import SwiftUI
import CoreData

struct MyPlanView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var plan: Plan
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \PlanEntity.name, ascending: true)
    ]) var items: FetchedResults<PlanEntity>
    
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(ColorManager.purple)]
        
        UITableView.appearance().backgroundColor = .clear
    }
    
   
    
    
    

    
    // FUNCTIONS
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            // find this item in our fetch request
            let item = items[offset]
            // delete it from the context
            moc.delete(item)
            
        }
        // save the context
        try? moc.save()
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
                            
                            List {
                                
                                    ForEach(items) { item in
                                        
                                        ListItemView(icon: item.category ?? "Unknown Category", title: item.name ?? "Unknown Name", subtitle: item.restaurant ?? "Unknown Restaurant", price: item.price ?? "Unknown Price", rightImage: "bag.circle")
                                        }
                                    .onDelete(perform: deleteItems)
                                    
                                DisclaimerView()
                                    
                                    
                
                                    
                                
                                
                            } //: LIST
                            .padding(.top, 100)
                            
                        } //: VSTACK
                        .toolbar {
                            EditButton()
                        }
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
