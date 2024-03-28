//
//  ContentView.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RootScreen()
                    .environmentObject(Auth.shared)
    }
}

#Preview {
    ContentView()
}
