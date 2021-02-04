//
//  MovieCard.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

struct MovieCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.blue)
                .aspectRatio(0.8, contentMode: .fit)
            Text("Movie")
        }
        
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard()
    }
}
