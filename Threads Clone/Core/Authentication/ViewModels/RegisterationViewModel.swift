//
//  RegisterationViewModel.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 27/08/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withemail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}
