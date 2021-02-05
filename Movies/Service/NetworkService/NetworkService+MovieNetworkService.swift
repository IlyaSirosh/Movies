//
//  NetworkService+MovieNetworkService.swift
//  Movies
//
//  Created by Illya Sirosh on 05.02.2021.
//

import Foundation

extension NetworkService: MovieNetworkService {
    func loadMoviePreviews(completion: @escaping (Result<[MoviePreview], Error>) -> Void) {
        
    }
    
    func loadMovieDetails(forMovieId: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        
    }
}
