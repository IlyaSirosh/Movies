//
//  MoviesApp.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

@main
struct MoviesApp: App {
    let viewAssembly: ViewAssembly
    let authService: AuthService
    
    init() {
        self.viewAssembly = ViewAssembly()
        self.authService = viewAssembly.authService
        self.authService.getNewRequestToken()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authService)
                .environmentObject(viewAssembly)
        }
    }
}
