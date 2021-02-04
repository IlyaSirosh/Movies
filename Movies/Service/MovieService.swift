//
//  MovieService.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

class MovieService {
    
    private static let movie = Movie(id: 1,
                           title: "Lord of the Rings: The Fellowship of the Ring",
                           posterURL: URL(string: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9J7XACn3tlD6v4UXRMvT2wJN8FGCCPeh8U3RkZ6__tR4wGhSo")!,
                           genres: [ Movie.Genre(id: 1, name: "Fantasy"), Movie.Genre(id: 2, name: "Anvanture"), Movie.Genre(id: 2, name: "Anvanture2"), Movie.Genre(id: 2, name: "Anvanture3")],
                           rating: 8.8,
                           language: "English",
                           duration: 228,
                           overview: "A young hobbit, Frodo, who has found the One Ring that belongs to the Dark Lord Sauron, begins his journey with eight companions to Mount Doom, the only place where it can be destroyed.")
    static let preview = MoviePreview(id: 1, title: "Lord of the Rings: The Fellowship of the Ring", posterURL: URL(string: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9J7XACn3tlD6v4UXRMvT2wJN8FGCCPeh8U3RkZ6__tR4wGhSo")!)
    
    
    func loadMoviePreviews(onLoad: @escaping ([MoviePreview]) -> Void) {
        let previews: [MoviePreview] = (1...20).map { i -> MoviePreview in
            MoviePreview(id: i, title: "Lord of the Rings: The Fellowship of the Ring \(i)", posterURL: URL(string: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9J7XACn3tlD6v4UXRMvT2wJN8FGCCPeh8U3RkZ6__tR4wGhSo")!)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onLoad(previews)
        }
        
    }
    
    func loadMovieDetails(for movie: MoviePreview,  onLoad: @escaping (Movie?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onLoad(Self.movie)
        }
    }
    
}
