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
