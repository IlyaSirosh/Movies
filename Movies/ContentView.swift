//
//  ContentView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var assembly: ViewAssembly
    
    var body: some View {
        assembly.getMoviesView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
