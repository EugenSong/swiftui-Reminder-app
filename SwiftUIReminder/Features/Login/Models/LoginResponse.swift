//
//  LoginResponse.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/27/24.
//

import Foundation

// (parent)
struct LoginResponse: Decodable {
    let data: LoginResponseData
}

// Decode from JSON into object I can work with - IMPORTANT... THIS SYNTAX IS A WAY TO INDICATE NESTED DECODABLE JSON DATA
// (nested child)
struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
