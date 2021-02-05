//
//  MovieService.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

protocol MovieNetworkService {
    func loadMoviePreviews(completion: @escaping (Result<[MoviePreview], Error>) -> Void)
    func loadMovieDetails(forMovieId: Int, completion: @escaping (Result<Movie, Error>) -> Void)
}

class MovieService {
    private let networkService: MovieNetworkService
    
//    private static let movie = Movie(id: 1,
//                           title: "Lord of the Rings: The Fellowship of the Ring",
//                           posterURL: URL(string: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9J7XACn3tlD6v4UXRMvT2wJN8FGCCPeh8U3RkZ6__tR4wGhSo")!,
//                           genres: [ Movie.Genre(id: 1, name: "Fantasy"), Movie.Genre(id: 2, name: "Anvanture"), Movie.Genre(id: 2, name: "Anvanture2"), Movie.Genre(id: 2, name: "Anvanture3")],
//                           rating: 8.8,
//                           language: "English",
//                           duration: 228,
//                           overview: "A young hobbit, Frodo, who has found the One Ring that belongs to the Dark Lord Sauron, begins his journey with eight companions to Mount Doom, the only place where it can be destroyed.")
//    static let preview = MoviePreview(id: 1, title: "Lord of the Rings: The Fellowship of the Ring", posterURL: URL(string: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9J7XACn3tlD6v4UXRMvT2wJN8FGCCPeh8U3RkZ6__tR4wGhSo")!)
    
    init(networkService: MovieNetworkService) {
        self.networkService = networkService
    }
    
    
    func loadMoviePreviews(onLoad: @escaping ([MoviePreview]) -> Void) {
        networkService.loadMoviePreviews { result in
            switch result {
            case .success(let previews):
                onLoad(previews)
            case .failure(_):
                onLoad([MoviePreview]())
            }
        }
        
    }
    
    func loadMovieDetails(for movie: MoviePreview,  onLoad: @escaping (Movie?) -> Void) {
        networkService.loadMovieDetails(forMovieId: movie.id) { result in
            switch result {
            case .success(let movie):
                onLoad(movie)
            case .failure(_):
                onLoad(nil)
            }
        }
    }
    
}
