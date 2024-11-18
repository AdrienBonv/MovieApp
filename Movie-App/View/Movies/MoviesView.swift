//
//  MoviesView.swift
//  Movie-App
//
//  Created by Adrien BONVALLET on 04/10/2024.
//

import SwiftUI

struct MoviesView: View {
    @StateObject private var networkManager: NetworkManager
    
    init() {
        _networkManager = StateObject(wrappedValue: NetworkManager())
    }
    
    var body: some View {
        NavigationView {
            MovieListView(networkManager: networkManager)
        }
    }
    
    
}

struct MovieListView: View {
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(networkManager.movies) { movie in
                    NavigationLink(destination: DetailMovieView(movie: .constant(movie))) {
                        MovieRowView(movie: movie)
                    }
                }
                if (networkManager.currentPage <= networkManager.totalPages) {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .onAppear {
                            networkManager.getDiscoverMovies()
                        }
                }
            }
        }
        .refreshable {
            networkManager.getDiscoverMovies()
        }
    }
}

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: "\(Constants.Image.baseURL)\(movie.poster_path)")) { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 80, height: 120)
                .cornerRadius(10)
                
                VStack (alignment: .leading) {
                    Text(movie.original_title)
                        .font(.headline)
                        .bold()
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", movie.vote_average))
                            .font(.subheadline)
                        Spacer()
                        Text(formattedReleaseDate)
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                    Text(movie.overview)
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .lineLimit(3)
                }
            }
            .padding()
            .background(Color("Background"))
            .cornerRadius(20)
        }
        .padding(.horizontal, 10)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var formattedReleaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: movie.release_date) {
          dateFormatter.dateFormat = "MMM d, yyyy"
          return dateFormatter.string(from: date)
        }
        return movie.release_date
    }
}


#Preview {
    MoviesView()
}
