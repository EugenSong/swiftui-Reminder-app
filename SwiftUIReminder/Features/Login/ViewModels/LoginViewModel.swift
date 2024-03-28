//
//  LoginViewModel.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/27/24.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""
                                                
    func login() {
        LoginAction(
            parameters: LoginRequest(       // LoginRequest is encoded in JSON in LoginAction
                username: username,
                password: password
            )
            
            // .call() is a function that takes a completion handler as its argument
            // *** BELOW = COMPLETION HANDLER() ORDER RELATIVE TO THE PARENT IT WAS PROVIDED TO ***
            // order is the following... first code inside call() runs -> the network call is made 
            // (the network call also has a closure where it waits for a response) ->
            // the response is then returned to caller's [call()'s] callback code, where call()'s callback function can use the LoginResponse object ... in this case just navigate to the Home Screen
        ).call { response in
            // Login successful, navigate to the Home screen
            // this block is called a closure (closure = parameter list + body)
            print("Access token", response.data.accessToken)
            Auth.shared.setCredentials(
                           accessToken: response.data.accessToken,
                           refreshToken: response.data.refreshToken
                       )
        }
    }
}
