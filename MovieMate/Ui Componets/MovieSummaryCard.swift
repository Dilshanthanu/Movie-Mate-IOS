//
//  MovieSummaryCard.swift
//  MovieMate
//
//  Created by Dilshan Thanushka on 2025-11-21.
//

import SwiftUI


struct MovieSummaryCard: View {
    let movie: MovieSummary
    var body : some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: movie.poster)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipped()
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                            .overlay(ProgressView())
                    }
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.headline)
                Text("\(movie.year) | \(movie.type)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)  
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
        
    }
}

#Preview {
    MovieSummaryCard(movie: .sample)
}
