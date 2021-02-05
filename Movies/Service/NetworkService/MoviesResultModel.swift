//
//  PopularMoviesResult.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

struct PopularMoviesResult {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [MoviePreviewData]
    
}

extension PopularMoviesResult {
    struct MoviePreviewData {
        let id: Int
        let title: String
        let poster_path: String?
    }
}

extension PopularMoviesResult {
    struct MovieData {
        let id: Int
        let title: String
        let poster_path: String?
        let original_language: String
        let genres: [MovieData.Genre]
        let runtime: Int?
        let overview: String?
        let vote_avarage: Double
        
        struct Genre {
            let id: Int
            let name: String
        }
    }
}
