//
//  Movie.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let posterURL: URL
    let genres: [Genre]
    let rating: Double
    let language: String
    let duration: Int?
    let overview: String?
    
    struct Genre: Identifiable {
        let id: Int
        let name: String
    }
}
