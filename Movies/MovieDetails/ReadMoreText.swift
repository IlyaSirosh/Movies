//
//  ReadMoreText.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI

struct ReadMoreText: View {
    let text: String
    let lineLimit: Int
    
    init(_ text: String, lineLimit: Int = 3){
        self.text = text
        self.lineLimit = lineLimit
    }
    
    @State private var isShowMoreVisible = true
    private var currentlineLimit: Int? {
        isShowMoreVisible ? lineLimit : nil
    }
    
    var body: some View {
        VStack {
            Text(text)
                .lineLimit(currentlineLimit)
            HStack {
                Spacer()
                Button(isShowMoreVisible ? "Read more" : "less") {
                    isShowMoreVisible.toggle()
                }
            }
     
        }.frame(maxHeight: .infinity)
    }

}
