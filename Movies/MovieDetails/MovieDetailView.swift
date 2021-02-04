//
//  MovieDetailView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI
import URLImage

struct MovieDetailView: View {
    let movie: Movie

    init() {
        self.movie = Movie(id: 1,
                           title: "Lord of the Rings: The Fellowship of the Ring",
                           posterURL: URL(string: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9J7XACn3tlD6v4UXRMvT2wJN8FGCCPeh8U3RkZ6__tR4wGhSo")!,
                           genres: [ Movie.Genre(id: 1, name: "Fantasy"), Movie.Genre(id: 2, name: "Anvanture"), Movie.Genre(id: 2, name: "Anvanture2"), Movie.Genre(id: 2, name: "Anvanture3")],
                           rating: 8.8,
                           language: "English",
                           duration: 228,
                           overview: "A young hobbit, Frodo, who has found the One Ring that belongs to the Dark Lord Sauron, begins his journey with eight companions to Mount Doom, the only place where it can be destroyed.")
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ScrollView {
            VStack {

                MovieDetailHeader(movie: movie)
                    .frame(height: size.height * 0.5)
                    .padding(.bottom)

                VStack {
                    AboutMovieView(movie: movie)
                    
                    if let overview = movie.overview {
                        DescriptionView(title: "Overview") {
                            ReadMoreText(overview)
                        }
                    }
                }.padding()
                
            }.frame(width: size.width)
            
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
