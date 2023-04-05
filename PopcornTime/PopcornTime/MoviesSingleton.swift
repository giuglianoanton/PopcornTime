//
//  MoviesSingleton.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 29/03/23.
//

import Foundation

class MoviesSingleton: ObservableObject {
    @Published var movies: [Media] = []
    static let sharedInstance = MoviesSingleton()
    private init(){
    }
    
    func didTapHeart(movie: Media){
            if !MoviesSingleton.sharedInstance.movies.contains(where: {$0.id == movie.id}) {
                movies.append(movie)
                print("saved")
                printMovies()
                print(movies.count)
            }else{
                if let index = MoviesSingleton.sharedInstance.movies.firstIndex(where: {$0.id == movie.id}){
                    movies.remove(at: index)
                    print("unsaved")
                    printMovies()
                    print(movies.count)
                }
            }
    }
    
    func remove(movie: Media){
        if let index = MoviesSingleton.sharedInstance.movies.firstIndex(where: {$0.id == movie.id}){
            movies.remove(at: index)
        }
    }
    
    
    func printMovies(){
        print("Movies list:")
        print(MoviesSingleton.sharedInstance.movies)
    }
}
