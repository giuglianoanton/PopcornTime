//
//  DetailMovieSingleton.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 29/04/23.
//

import Foundation

class DetailMovieSingleton: ObservableObject {
    
    @Published var movie: Media?
    static let sharedInstance = DetailMovieSingleton()
    private init(){
    }
    
    func didSelect(movie: Media){
        DetailMovieSingleton.sharedInstance.movie = movie
    }
}
