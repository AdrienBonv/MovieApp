//
//  NetworkManager.swift
//  Movie-App
//
//  Created by Adrien BONVALLET on 03/10/2024.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var currentPage: Int = 1
    @Published var totalPages: Int = 0
    
    private var baseURL = Constants.API.baseURL

    init() {
        getDiscoverMovies()
    }
    
    func getDiscoverMovies() {
        let url = URL(string: "\(baseURL)/discover/movie")!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "include_adult", value: "false"),
            URLQueryItem(name: "include_video", value: "false"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: String(currentPage)),
            URLQueryItem(name: "sort_by", value: "popularity.desc"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.timeoutInterval = 10
            request.allHTTPHeaderFields = [
                "accept": "application/json",
                "Authorization": "Bearer \(Constants.Secrets.apiKey)"]

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                    DispatchQueue.main.async {
                        if (self.totalPages == 0) {
                            self.totalPages = movieResponse.total_pages
                        }
                        let newMovies = movieResponse.results.map { movie in
                            let updatedMovie = movie
                            self.currentPage += 1
                            return updatedMovie
                        }
                        print(newMovies)
                        self.movies.append(contentsOf: newMovies)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
