//
//  MovieDetailView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI
import URLImage

struct MovieDetailView: View {
    @ObservedObject var model: MovieDetailViewModel
    
    let preview: MoviePreview
    
    init(preview: MoviePreview, model: MovieDetailViewModel) {
        self.preview = preview
        self.model = model
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }.onAppear {
            model.loadMovieDetails(for: preview)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ScrollView {
            VStack {
                MovieDetailHeader(movie: preview)
                    .frame(height: size.height * 0.5)
                    .padding(.bottom)
                
              
                Group {
                    switch model.state {
                    case .present(let movie):
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Rate: \(String(format: "%.1f", movie.rating)) ")
                                .font(.body)
                            
                            AboutMovieView(movie: movie)
                            
                            if let overview = movie.overview {
                                DescriptionView(title: "Overview") {
                                    ReadMoreText(overview)
                                }
                            }
                        }.padding()
                    case .loading:
                        ProgressView()
                            .padding(size.height * 0.2)
                    case .empty:
                        Text("We are missing details")
                            .foregroundColor(Color.gray.opacity(0.8))
                            .frame(width: size.width, height: size.height * 0.4, alignment: .center)
                    }
                }
   
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}
