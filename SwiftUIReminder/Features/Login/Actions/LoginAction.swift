//
//  LoginAction.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/27/24.
//


import Foundation

struct LoginAction {
    
    var parameters: LoginRequest
    
    func call(completion: @escaping (LoginResponse) -> Void) {
        
        let scheme: String = "https"
        let host: String = "9fd800de-4657-4e03-912b-980dc1cf9e75.mock.pstmn.io"
        let path = "/login"
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        guard let url = components.url else {
            return
        }
        
        // create the request headers
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body") // Need this request header to mock requests
        
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            // Error: Unable to encode request parameters
            print("Unable to encode request parameters")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in    // this is the completion handler (closure) for the network request
            if let data = data {
                
                // The .decode(...) method takes two arguments: the type of object you want to 
                //decode the data into (LoginResponse.self) important... VIA Swift type inference, and the data itself (data).
                let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
                
                if let response = response {
                    completion(response)
                } else {
                    // Error: Unable to decode response JSON
                }
            } else {
                // Error: API request failed

                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}

