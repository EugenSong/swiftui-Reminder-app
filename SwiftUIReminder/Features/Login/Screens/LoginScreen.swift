//
//  LoginScreen.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/27/24.
//

import SwiftUI

struct LoginScreen: View {
    // observing the LoginViewModel...any changes made to ViewModel causes the LoginScreen to re-render
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
           VStack {
               
               Spacer()
               
               VStack {
                   // uses localized strings
                   TextField(
                       "Login.UsernameField.Title",
                       text: $viewModel.username
                   )
                   .autocapitalization(.none)
                   .disableAutocorrection(true)
                   .padding(.top, 20)
                   Divider()
                   SecureField(
                       "Login.PasswordField.Title",
                       text: $viewModel.password
                   )
                   .padding(.top, 20)
                   Divider()
               }
               
               Spacer()
               
               Button(
                   action: viewModel.login,
                   label: {
                       Text("Login.LoginButton.Title")
                           .modifier(MainButton())
                   }
               )
           }
           .padding(30)
       }
}

#Preview {
    LoginScreen()
}
