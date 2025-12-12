//
//  ContentView.swift
//  MovieMate
//
//  Created by Dilshan Thanushka on 2025-11-19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = MovieViewModel()
    @State private var searchText: String = ""
  
    
    var body: some View {
        NavigationStack {
            
            
            VStack {
                switch viewModel.appState {
                case .loading:
                    ProgressView()
                case .falier:
                    EmptyView()
                case .success:
                    if let movie = viewModel.searchResults {
                                   MovieCard(movie: movie)
                       
                               } else {
                                   EmptyView()
                               }
                    ScrollView {
                        ForEach(viewModel.searchResultsList, id: \.imdbID) { movie in
                            MovieSummaryCard(movie: movie)
                        }
                    }

                    
                case .idle:
                       EmptyView()
                }
                       
                    }
            .task {
                await viewModel.searchMovies(title: "ava")
            }
                    .padding()
                    .navigationTitle("Movie Mate")
                    .searchable(text: $searchText, prompt: "Search movie")
                    .onChange(of: searchText) { newValue in
                        Task {
                            await viewModel.fetchMovieByTitle(title: newValue)
                            
                        }
                    }

                    
        }
        
    }
}


#Preview {
    ContentView()
}
