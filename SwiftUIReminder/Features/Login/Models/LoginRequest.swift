//
//  LoginRequest.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/27/24.
//

import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}
/*
{
    "username": "YOUR_USERNAME",
    "password": "YOUR_PASSWORD"
}
*/
