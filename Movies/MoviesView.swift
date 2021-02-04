//
//  MoviesView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

struct MoviesView: View {
    @State var selectedMovie: Int?
    let cards: [Int] = (1...101).map { $0 }
    
    let layout = [
        GridItem(), GridItem()
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(cards, id: \.self) { card in
                        ZStack {
                            MovieCard().onTapGesture {
                                selectedMovie = card
                            }
                        NavigationLink(
                            destination: MovieDetailView(),
                            tag: card,
                            selection: $selectedMovie,
                            label: {EmptyView()})
                        }
                    }
                }.padding()
            }
            .navigationTitle("Popular Movies") 
        }
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
