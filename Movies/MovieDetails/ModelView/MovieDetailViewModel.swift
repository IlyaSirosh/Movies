//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie? {
        didSet {
            state = movie != nil ? .present(movie!) : .empty
        }
    }
    @Published var state: State
    private let movieService: MovieService
    
    init(movieService: MovieService) {
        self.state = .empty
        self.movieService = movieService
    }
    
    func loadMovieDetails(for preview: MoviePreview) {
        state = .loading
        movieService.loadMovieDetails(for: preview) { [weak self] movie in
            self?.movie = movie
        }
    }
    
    
    enum State {
        case empty, loading, present(Movie)
    }
}
