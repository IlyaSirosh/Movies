//
//  LoginViewModel.swift
//  Movies
//
//  Created by Illya Sirosh on 05.02.2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authService: AuthService
    @Published var state: AuthService.AuthState
    
    init(authService: AuthService){
        self.authService = authService
        self.state = authService.state
        
        authService.$state.assign(to: &$state)
    }
    
    func signIn(username: String, password: String) {
        authService.signIn(username: username, password: password)
    }
    
}
