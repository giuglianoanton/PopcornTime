//
//  Helpers.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import Foundation
import UIKit


func getRequestForSection(searchKey: String, cell: CollectionViewTableViewCell){
    ApiCaller.shared.getRequest(searchKey: searchKey){x in
        let result = x
        switch result {
        case .success(let moviesResponse):
            cell.movies = moviesResponse
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

func pushToDetailedView(navigationController: UINavigationController){
    let vc = DetailedViewController()
    if let movie = DetailMovieSingleton.sharedInstance.movie{
        vc.configure(with: movie)
        navigationController.pushViewController(vc, animated: true)
        //make the heart in the detailed view fill if it's been tapped
        if MoviesSingleton.sharedInstance.movies.contains(where: {$0.id == movie.id}){
            vc.heartButton.isSelected = true
        } else{
            vc.heartButton.isSelected = false
        }
    }
}
