//
//  AboutMovieView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

struct AboutMovieView: View {
    let movie: Movie
    
    private let layout = [GridItem(.fixed(100), alignment: .top),
                          GridItem(.adaptive(minimum: 150, maximum: 250), alignment: .top),
                          GridItem(.fixed(100), alignment: .top)]
    
    var body: some View {
        LazyVGrid(columns: layout, alignment: .center) {
            DescriptionView(title: "Duration") {
                Text(duration)
            }
  
            DescriptionView(title: "Genre") {
                Text(movie.genres.map { $0.name }.joined(separator: ", "))
            }
 
            DescriptionView(title: "Language") {
                Text(movie.language)
            }
        }
    }
    
    private var duration: String {
        if let totalMinutes = movie.duration {
            let hours = totalMinutes / 60
            let minutes = totalMinutes % 60
            var label = ""
            
            if hours != 0 {
                label += "\(hours)h "
            }
            
            if minutes != 0 {
                label += "\(minutes)m"
            }
            
            return label
        } else {
            return "-"
        }
    }
}
