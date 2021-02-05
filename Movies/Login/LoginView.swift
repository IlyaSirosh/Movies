//
//  LoginView.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @ObservedObject var model: LoginViewModel
    @State private var email = "TestYouAreLaunched"
    @State private var password = "12345"
    
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
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
              SecureField("Password", text: self.$password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .textContentType(.password)
            }.padding(.horizontal, 27.5)
            Text(errorText)
                .font(.caption)
                .foregroundColor(.red)
            Button(action: {
                model.signIn(username: email, password: password)
            }) {
              Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 180, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
            }
            .overlay(
                Group {
                    if model.state == .signing {
                        ZStack {
                            Color.white.opacity(0.4)
                            ProgressView()
                        }
                    }
                }
            )
            .disabled(model.state == .signing)
            .padding(.vertical, 30)
            Spacer()
        }
    }
    
    
    var errorText: String {
        switch model.state {
        case .notSigned:
            return "not signed"
        case .failToSign(let reason):
            return "\(reason)"
        default:
            return ""
        }
    }
}
