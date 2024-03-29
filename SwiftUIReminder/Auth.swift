//
//  Auth.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/28/24.
//

import Foundation
import KeychainAccess

class Auth: ObservableObject {
    struct Credentials {
        var accessToken: String?
        var refreshToken: String?
    }
    
    enum KeychainKey: String {
        case accessToken
        case refreshToken
    }
    
    // create a shared Auth object (uses Singleton design pattern)
    static let shared: Auth = Auth()
    
    private let keychain: Keychain = Keychain(service: "SwiftUIReminder-Token")
    
    // @Published property wrapper ensures that changes to the "loggedIn" property are automatically published to any views observing it
    // see RootScreen.swift for more on @Published, @EnvironmentObject and observed values relative to Views and heirarchy
    @Published var loggedIn: Bool = false
    
    private init() {
        loggedIn = hasAccessToken()
    }
    
    func getCredentials() -> Credentials? {
        do {
            let accessToken = try keychain.get(KeychainKey.accessToken.rawValue)
            let refreshToken = try keychain.get(KeychainKey.refreshToken.rawValue)
            return Credentials(accessToken: accessToken, refreshToken: refreshToken)
        } catch {
            print("Error retrieving credentials from keychain: \(error)")
            return nil
        }
    }

    func setCredentials(accessToken: String, refreshToken: String) {
        do {
            try keychain.set(KeychainKey.accessToken.rawValue, key: "accessToken")
            try keychain.set(KeychainKey.refreshToken.rawValue, key: "refreshToken")
            // the Published variable needs to be updated on the main thread
            DispatchQueue.main.async {
                        self.loggedIn = true
                    }
        } catch {
            print("Error setting credentials in keychain: \(error)")
        }
    }

    func hasAccessToken() -> Bool {
        return getCredentials()?.accessToken != nil
        }
        
    func getAccessToken() -> String? {
        return getCredentials()?.accessToken
    }

    func getRefreshToken() -> String? {
        return getCredentials()?.refreshToken
    }

    func logout() {
        do {
            try keychain.remove("accessToken")
            try keychain.remove("refreshToken")
        } catch let error {
            print("error: \(error)")
        }
        
        loggedIn = false
    }

}
