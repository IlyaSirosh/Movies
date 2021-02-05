//
//  PopularMoviesResult.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

struct PopularMoviesResult: Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [MoviePreviewData]
}



extension PopularMoviesResult {
    struct MoviePreviewData: Decodable {
        let id: Int
        let title: String
        let poster_path: String
    }
}

extension PopularMoviesResult {
    struct MovieData: Decodable {
        let id: Int
        let title: String
        let poster_path: String
        let original_language: String
        let genres: [MovieData.Genre]
        let runtime: Int?
        let overview: String?
        let vote_average: Double
        let spoken_languages: [Language]
        
        struct Language: Decodable {
            let english_name: String
            let iso_639_1: String
            let name: String
        }

        struct Genre: Decodable {
            let id: Int
            let name: String
        }
    }
}
