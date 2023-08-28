//
//  LoginViewModel.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 27/08/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withemail: email, password: password)
    }
}
