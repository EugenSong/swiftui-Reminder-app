//
//  HomeViewModel.swift
//  SwiftUIReminder
//
//  Created by Eugene Song on 3/28/24.
//

import Foundation

class HomeViewModel: ObservableObject {

    func logout() {
        Auth.shared.logout()
    }
}
