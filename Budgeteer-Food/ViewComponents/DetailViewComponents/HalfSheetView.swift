//
//  HalfSheetView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/7/22.
//

import SwiftUI
// use with ZStack

struct HalfSheetView: View {
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                ColorManager.background
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Rectangle()
                            .frame(height: geo.size.height - 100)
                            .cornerRadius(30, antialiased: false)
                            .foregroundColor(.white)
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


