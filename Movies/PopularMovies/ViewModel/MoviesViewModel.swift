//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

class MoviesViewModel: ObservableObject {
    private let movieService: MovieService
    @Published var state: State
    @Published var previews: [MoviePreview] {
        didSet {
            if previews.isEmpty {
                state = .empty
            } else {
                state = .hasPreviews
            }
        }
    }
    
    
    init(movieService: MovieService) {
        self.previews = []
        self.state = .empty
        self.movieService = movieService
    }
    
    
    func loadPreviews() {
        state = .loading
        movieService.loadMoviePreviews { [weak self] movies in
            self?.previews = movies
        }
    }

    
    enum State {
       case loading, hasPreviews, empty
    }
}
