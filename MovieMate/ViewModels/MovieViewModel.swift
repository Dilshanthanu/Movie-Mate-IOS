//
//  MovieViewModel.swift
//  MovieMate
//
//  Created by Dilshan Thanushka on 2025-11-19.
//

import Foundation
import Observation

@Observable
class MovieViewModel {
    var networkService = NetworkService()
    var searchResults: Movie?
    var searchMoviesResults: [Movie] = []
    var searchResultsList: [MovieSummary] = []
    var errorMessage: String?
    var appState: AppState = .idle
    
    

    func fetchMovieByTitle(title: String) async {
        
        appState = .loading
        do {
            let result = try await networkService.fetchMoveByTitle(title)
            searchResults = result
            appState = .success
            
        } catch {
            errorMessage = "Something went wrong"
            appState = .falier
        }
    }
    
    func searchMovies(title: String) async {
        appState = .loading
        
        do {
            let result = try await networkService.searchByTitle(title)

            if result.response == "False" {
                appState = .falier
                return
            }
            
            searchResultsList = result.search ?? []
            appState = .success

        } catch {
            errorMessage = "Something went wrong"
            appState = .falier
        }
    }

}
