//
//  NetworkService+MovieNetworkService.swift
//  Movies
//
//  Created by Illya Sirosh on 05.02.2021.
//

import Foundation
import Alamofire

extension NetworkService: MovieNetworkService {
    
    func loadMoviePreviews(completion: @escaping (Result<[MoviePreview], Error>) -> Void) {
        guard let _ = requestToken else { completion(.failure(RequestError.NoRequestToken)); return }
        let url = urlString(for: "movie/popular")
        
        AF.request(url, method: .get)
            .responseData(queue: .main) { [unowned self] response in
                do {
                    let movies = try self.handlePreviewsResponse(response)
                    completion(.success(movies))
                } catch {
                    completion(.failure(error))
                }
            }
        
    }
    
    private func handlePreviewsResponse(_ response: DataResponse<Data, AFError>) throws -> [MoviePreview] {
        switch response.result {
        case .success(let data):
            let result = try JSONDecoder().decode(PopularMoviesResult.self, from: data)
            
            return result.results.map { mapPreview($0) }
        case .failure(let error):
            throw error
        }
    }
    
    private func mapPreview(_ data: PopularMoviesResult.MoviePreviewData) -> MoviePreview {
        MoviePreview(id: data.id,
                     title: data.title,
                     posterURL: imageURL(for: data.poster_path))
    }
    
    
    func loadMovieDetails(forMovieId movieId: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        guard let _ = requestToken else { completion(.failure(RequestError.NoRequestToken)); return }
        let url = urlString(for: "movie/\(movieId)")
        print(url)
        AF.request(url, method: .get)
            .responseData(queue: .main) { [unowned self] response in
                do {
                    let movie = try self.handleMovieDetailsResponse(response)
                    completion(.success(movie))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
    }
    
    private func handleMovieDetailsResponse(_ response: DataResponse<Data, AFError>) throws -> Movie {
        switch response.result {
        case .success(let data):
            let result = try JSONDecoder().decode(PopularMoviesResult.MovieData.self, from: data)
            return map(result)
        case .failure(let error):
            throw error
        }
    }
    
    private func map(_ data: PopularMoviesResult.MovieData) -> Movie {
        Movie(id: data.id,
              title: data.title,
              posterURL: imageURL(for: data.poster_path),
              genres: data.genres.map { Movie.Genre(id: $0.id, name: $0.name) },
              rating: data.vote_average,
              language: getLanguage(data),
              duration: data.runtime,
              overview: data.overview)
    }
    
    private func getLanguage(_ data: PopularMoviesResult.MovieData) -> String {
        data.spoken_languages.first { len -> Bool in
            len.iso_639_1 == data.original_language
        }?.english_name ?? data.original_language
    }
    
    private func imageURL(for path: String) -> URL {
        URL(string: "\(imageBaseURL)/\(path)?api_key=\(apiKey)")!
    }
    
}
