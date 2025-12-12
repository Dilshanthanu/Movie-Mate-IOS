//
//  MovieCard.swift
//  MovieMate
//
//  Created by Dilshan Thanushka on 2025-11-20.
//

import SwiftUI

struct MovieCard: View {
let movie: Movie

var body: some View {
    VStack(alignment: .leading, spacing: 12) {
        
        AsyncImage(url: URL(string: movie.poster)) { image in
            image
                .resizable()
                .frame(height: 200)
                .clipped()
        } placeholder: {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 200)
                .overlay {
                    ProgressView()
                }
        }
        VStack(alignment: .leading, spacing: 4) {
            Text(movie.title)
                .font(.headline)
            
            Text("\(movie.year) • \(movie.rated) • \(movie.runtime)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(movie.genre)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    .background(Color.white)
    .cornerRadius(16)
    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    .padding()
}

}

#Preview {
    MovieCard(movie: Movie(title: "Test Movie", year: "25/11/2025", rated: "5", runtime: "1h 30m", genre: "Genre", director: "test director", writer: "test wirter ", actors: "test actor", plot: "test plot", poster: "https://m.media-amazon.com/images/M/MV5BM2JiZjU1NmQtNjg1Ni00NjA3LTk2MjMtNjYxMTgxODY0NjRhXkEyXkFqcGc@._V1_SX300.jpg"))
}
