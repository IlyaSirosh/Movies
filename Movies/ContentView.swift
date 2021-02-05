//
//  ContentView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var assembly: ViewAssembly
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        if authService.isAuthorized {
            assembly.getMoviesView()
        } else {
            assembly.getLoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
