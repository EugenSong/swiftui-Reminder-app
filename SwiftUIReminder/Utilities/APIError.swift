//
//  APIError.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/28/24.
//

import Foundation

enum APIError: String, Error {
    case jsonDecoding
    case response
}
