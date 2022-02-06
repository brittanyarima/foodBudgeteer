//
//  EditCountdownView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 2/5/22.
//

import SwiftUI

struct EditCountdownView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var newDate = Date()
    
    var dateToString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return(formatter.string(from: newDate))
    }
    
    var body: some View {
        VStack {
            // Title
            HStack {
                Text("Edit Countdown")
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

            } //: HSTACK
            
            Divider()
           
            
            VStack {
                HStack {
                    Text("Date of Trip:")
                        .font(.title2)
                        .bold()
                    
                    
                    // current trip date or "Please set trip date"
                    Text(dateToString)
                        .font(.title2)
                        
                }
                .padding()
                
                VStack {
                    Text("Update Trip Date")
                        .font(.headline)
                    
                    DatePicker("When is your trip?", selection: $newDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(width: 300, height: 300, alignment: .center)
                }
                .padding(.top, 100)
                
              
                    
            
            }
            Spacer()
            
        }
        
    }
}

struct EditCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        EditCountdownView()
    }
}
