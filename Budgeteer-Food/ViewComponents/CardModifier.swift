//
//  CardModifier.swift
//  Budgeteer-Food
//
//  Created by Brittany Rima on 1/5/22.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct CardModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .modifier(CardModifier())
    }
}
