//
//  DetailMovieView.swift
//  Movie-App
//
//  Created by Adrien BONVALLET on 05/10/2024.
//

import SwiftUI

struct DetailMovieView: View {
    @Binding var movie: Movie
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading, spacing: 16) {
                ZStack (alignment: .bottomLeading){
                    AsyncImage(url: URL(string: "\(Constants.Image.baseURL)\(movie.poster_path)")) { result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(String(format: "%.1f", movie.vote_average))
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                }
                .frame(height: UIScreen.main.bounds.height * 0.6)
                
                VStack {
                    Text("Overview")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("Background"))
                        
                        Text(movie.overview)
                            .padding()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    DetailMovieView(movie:.constant(Movie.sampleData[0]))
}
