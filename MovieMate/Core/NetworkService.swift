//
//  NetworkService.swift
//  MovieMate
//
//  Created by Dilshan Thanushka on 2025-11-19.
//

import Foundation

private  var apikey = "13ef0d29"
struct NetworkService {
    
    func fetchMoveByTitle(_ title: String) async throws -> Movie? {
        
        
        let endpoint = "https://www.omdbapi.com/?t=\(title)&apikey=\(apikey)"
        
        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidURL
        }

        let (data , response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movie: Movie = try decoder.decode(Movie.self, from: data)
            
            return movie
        }catch{
            throw ApiError.unknown
        }
    }
    
    func searchByTitle(_ title: String) async throws -> SearchMovies {
        let endpoint = "https://www.omdbapi.com/?s=\(title)&apikey=\(apikey)"
        
        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidURL
        }
        
        let (data , response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let searchMovies: SearchMovies = try decoder.decode(SearchMovies.self, from: data)
            
            return searchMovies
        }catch {
            throw ApiError.unknown
        }
    }
}
