//
//  MovieDetailHeader.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI
import URLImage

struct MovieDetailHeader: View {
    let movie: MoviePreview

    
    var body: some View {
        ZStack {

            URLImage(url: movie.posterURL) { (image: Image) in
                return image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .shadow(color: Color.black.opacity(0.8), radius: 15, x: 0, y: 10)
            }
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading){
                    Text(movie.title)
                        .lineLimit(2)
                        .font(.largeTitle)
                        .padding(.horizontal)
                }.background(
                    Color.black
                        .blur(radius: 15)
                        .opacity(0.4)
                ).shadow(color: .black, radius: 10, x: 0, y: 5)
            }

            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
        }
//        .background(Color.black.opacity(0.1))
    }
}

