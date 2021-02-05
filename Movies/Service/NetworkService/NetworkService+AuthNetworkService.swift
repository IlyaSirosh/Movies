//
//  NetworkService+AuthNetworkService.swift
//  Movies
//
//  Created by Illya Sirosh on 05.02.2021.
//

import Foundation
import Alamofire

extension NetworkService: AuthNetworkService {
    var hasRequestToken: Bool {
        requestToken != nil
    }
    
    func createRequestToken(completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = urlString(for: "authentication/token/new")

        AF.request(url, method: .get).responseData { [unowned self] response in
            do {
                try handleAuthResponse(response)
                completion(.success(true))
            } catch {
                completion(.failure(error))
            }
        }
    }

    
    func singIn(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let requestToken  = requestToken else {
            completion(.failure(RequestError.NoRequestToken))
            return
        }
        let url = urlString(for: "authentication/token/validate_with_login")
        let body = SignInData(username: username, password: password, request_token: requestToken)
        
        AF.request(url, method: .post, parameters: body, encoder: JSONParameterEncoder.default).responseData { [unowned self] response in
            do {
                try handleAuthResponse(response)
                completion(.success(true))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    private func handleAuthResponse(_ response: AFDataResponse<Data>) throws {
        switch response.result {
        case .success(let data):
            if isSuccessResponseStatus(from: data) {
                let result = try decodeAuthResult(from: data)
                self.setRequestToken(result.request_token)
            } else {
                let errorStatus = try decodeAuthError(from: data)
                if errorStatus.status_code == 30 {
                    throw RequestError.WrongSignInData(errorStatus.status_message)
                } else {
                    throw RequestError.InvalidRequestToken(errorStatus.status_message)
                }
            }
        case .failure(let error):
            throw error
        }
    }
    
    private func decodeAuthResult(from data: Data) throws -> AuthRequestTokenResult {
        do {
            return try JSONDecoder().decode(AuthRequestTokenResult.self, from: data)
        } catch {
            throw RequestError.CannotDecodeAuthResult
        }

    }
    
    private func decodeAuthError(from data: Data) throws -> AuthRequestError {
        do {
            return try JSONDecoder().decode(AuthRequestError.self, from: data)
        } catch {
            throw RequestError.CannotDecodeAuthResult
        }
    }
    
    private func isSuccessResponseStatus(from data: Data) -> Bool {
        do {
            let result = try JSONDecoder().decode(AuthRequestStatus.self, from: data)
            return result.success
        } catch {
            return false
        }
    }
}

struct AuthRequestTokenResult: Decodable {
//    let expires_at: Date
    let request_token: String
}

struct AuthRequestStatus: Decodable{
    let success: Bool
}

struct AuthRequestError: Decodable {
    let status_message: String
    let status_code: Int
}

struct SignInData: Codable {
    let username: String
    let password: String
    let request_token: String
}
