//
//  MovieCard.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI
import URLImage

struct MovieCard: View {
    let preview: MoviePreview
    
    init(_ preview: MoviePreview) {
        self.preview = preview
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .aspectRatio(0.6, contentMode: .fill)
                .foregroundColor(Color.gray.opacity(0.3))
           
            URLImage(url: preview.posterURL) { (image:Image) in
                image
                    .resizable()
                    .aspectRatio(0.6, contentMode: .fill)
            }
     
            VStack(alignment: .leading) {
                Spacer()
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.6))
                        .frame(maxHeight: 50)
                    Text(preview.title)
                        .font(.headline)
                        .foregroundColor(Color.white.opacity(0.7))
                        .lineLimit(2)
                        .padding(5)
                }
            }
            
        }.cornerRadius(15)
        
    }
}

