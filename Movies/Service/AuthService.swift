//
//  AuthService.swift
//  Movies
//
//  Created by Illya Sirosh on 05.02.2021.
//

import Foundation

protocol AuthNetworkService {
    var hasRequestToken: Bool { get }
    
    func createRequestToken(completion: @escaping (Result<Bool, Error>) -> Void)
    func singIn(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    
}

class AuthService: ObservableObject {
    private var networkService: AuthNetworkService
    
    @Published private(set) var isAuthorized: Bool = false
    @Published private(set) var state: AuthState {
        didSet {
            isAuthorized = (state == .signed)
        }
    }
    
    init(networkService: AuthNetworkService) {
        self.networkService = networkService

        self.state = networkService.hasRequestToken ? .notSigned : .withoutAPIAccess
    }
    
    func signIn(username: String, password: String) {
        state = .signing
        networkService.singIn(username: username, password: password) { (result) in
            switch result {
            case .success(let isSigned):
                self.state = isSigned ? .signed : .failToSign("Cannot sign in with username/password")
            case .failure(let error):
                self.state = .failToSign(error.localizedDescription)
                print(error)
            }
        }
    }
    
    func getNewRequestToken() {
        if state == .withoutAPIAccess {
            networkService.createRequestToken { [unowned self] (result:Result<Bool, Error>) in
                switch result {
                case .success(let tokenCreated):
                    self.state = tokenCreated ? .notSigned : .failToSign("Cannot create request token")
                case .failure(let error):
                    self.state = .failToSign(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    enum AuthState: Equatable {
        case signed, signing, failToSign(String), notSigned, withoutAPIAccess
    }
}
