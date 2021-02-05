//
//  NetworkService.swift
//  Movies
//
//  Created by Illya Sirosh on 04.02.2021.
//

import Foundation
import Alamofire

class NetworkService {
    private var apiURL = "https://api.themoviedb.org/3"
    private(set) var requestToken: String?
    private(set) var apiKey: String = "3a00a4055c806e2ed9a47646e6f8a7f9"
    
    
    func urlString(for path: String) -> String {
        "\(apiURL)/\(path)?api_key=\(apiKey)"
    }
    
    func setRequestToken(_ token: String?){
        requestToken = token
    }
    
    enum RequestError: Error, CustomStringConvertible {
        case NoRequestToken, CannotDecodeAuthResult, WrongSignInData(String), InvalidRequestToken(String)
        
        var description: String {
            switch self {
            case .NoRequestToken:
                return "No Request Token available"
            case .CannotDecodeAuthResult:
                return "Unable to decode auth result"
            case .WrongSignInData(let reason):
                return "Wrong sign in data: \(reason)"
            case .InvalidRequestToken(let reason):
                return "Invalid request token: \(reason)"
            default:
                return "Some Request Error"
            }
        }
    }
}

extension LocalizedError where Self: CustomStringConvertible {
    var localizedDescription: String? {
        description
    }
}
