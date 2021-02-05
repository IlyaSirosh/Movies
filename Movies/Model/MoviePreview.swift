//
//  MoviePoster.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation

struct MoviePreview: Identifiable, Codable {
    let id: Int
    let title: String
    let posterURL: URL
}
