//
//  LoginAction.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/27/24.
//


import Foundation

struct LoginAction {
    
    var parameters: LoginRequest
    let path = "/login"
    let method: HTTPMethod = .post
    
    func call(completion: @escaping (LoginResponse) -> Void) {
        
        APIRequest<LoginRequest, LoginResponse>.call(
                   path: path,
                   method: .post,
                   parameters: parameters
               ) { data in
                   // The .decode(...) method takes two arguments: the type of object you want to
                   //decode the data into (LoginResponse.self) important... VIA Swift type inference, and the data itself (data).
                   if let response = try? JSONDecoder().decode(
                       LoginResponse.self,
                       from: data
                   ) {
                       completion(response)
                   } else {
                       print("Unable to decode response JSON")
                   }
               }
           }
       }
