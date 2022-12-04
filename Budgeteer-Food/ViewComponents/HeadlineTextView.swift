//
//  HeadlineTextView.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/7/22.
//

import SwiftUI

struct HeadlineTextView: View {
    let icon: String
    let text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                Text(text)
            }
            .padding(.horizontal, 20)
            .foregroundColor(ColorManager.lightGrey)
            .font(.headline)
            
            Divider()
                .padding(.horizontal)
        }
    }
}

struct HeadlineTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineTextView(icon: "dollarsign.circle", text: "my budget")
    }
}
