//
//  MainButton.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/28/24.
//

import SwiftUI

struct MainButton: ViewModifier {
    var color: Color = Color.blue
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .frame(maxWidth: .infinity, maxHeight: 60)
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(10)
    }
}
