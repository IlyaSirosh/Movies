//
//  LoginView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Movies")
                .font(.custom("Courgette-Regular", size: 96, relativeTo: .largeTitle))
            Spacer()
            VStack(alignment: .leading, spacing: 15) {
              TextField("Email", text: self.$email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
              SecureField("Password", text: self.$password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            }.padding(.horizontal, 27.5)
            Button(action: {}) {
              Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 180, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
            }.padding(.vertical, 30)
            Spacer()
        }
    }
    
    private static let padding: CGFloat = 20
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
