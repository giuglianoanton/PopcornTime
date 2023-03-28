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
