//
//  ViewBuilder.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

class ViewAssembly: ObservableObject {
    private let movieService: MovieService
    let authService: AuthService
    private let networkService: NetworkService
    
    init(){
        self.networkService = NetworkService()
        self.authService = AuthService(networkService: networkService)
        self.movieService = MovieService(networkService: networkService)
        
    }
    
    func getLoginView() -> some View {
        let viewModel = LoginViewModel(authService: authService)
        return LoginView(model: viewModel)
    }
    
    func getMoviesView() -> some View {
        let viewModel = MoviesViewModel(movieService: movieService)
        return MoviesView(model: viewModel)
    }
    
    func getMovieDetailView(for preview: MoviePreview) -> some View {
        let viewModel = MovieDetailViewModel(movieService: movieService)
        return MovieDetailView(preview: preview, model: viewModel)
    }
    
    
}
