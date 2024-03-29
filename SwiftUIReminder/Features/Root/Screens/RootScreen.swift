//
//  RootScreen.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/28/24.
//

import SwiftUI

struct RootScreen: View {
    
    // see below on env objects
    @EnvironmentObject var auth: Auth
    
    var body: some View {
        if auth.loggedIn {
            HomeScreen()
        } else {
            LoginScreen()
        }
    }
}

#Preview {
    RootScreen()
}

/* Note: .....@EnvironmentObject, @Published and Observed Values....
 In SwiftUI, when you use @EnvironmentObject to inject an object into a view hierarchy, the view and all of its descendants have access to that object. While the views themselves are not directly observing the Auth object, they are effectively observing its properties that are marked with @Published.

 When you declare @EnvironmentObject var auth: Auth, you're making the Auth object available to the view hierarchy. If any property within the Auth object marked with @Published changes, SwiftUI automatically triggers a view update for any views that are referencing that property. This mechanism allows views to reactively update based on changes to the Auth object, such as changes to the loggedIn property.

 So, while the views are not directly observing the Auth object itself, they are observing its @Published properties like loggedIn, which effectively means they are observing changes to the Auth object's state. This allows for reactive UI updates based on changes in authentication status.
 */
