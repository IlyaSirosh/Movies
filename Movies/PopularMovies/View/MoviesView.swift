//
//  MoviesView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject var assembly: ViewAssembly
    @ObservedObject var model: MoviesViewModel
    
    let layout = [
        GridItem(), GridItem()
    ]
    
    var body: some View {
        NavigationView {
            Group {
                switch model.state {
                case .loading:
                    ProgressView()
                case .hasPreviews:
                    ScrollView {
                        LazyVGrid(columns: layout) {
                            ForEach(model.previews) { preview in
                                NavigationLink(destination: assembly.getMovieDetailView(for: preview) ) {
                                    MovieCard(preview)
                                }
                            }
                        }.padding()
                    }
                case .empty:
                    Text("No movies(")
                }
            }.navigationTitle("Popular Movies")
        }.onAppear {
            model.loadPreviews()
        }
    }
    
    
}

