//
//  MyListViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit
import SwiftUI

class MyListViewController: UIViewController {
    
    
    var container = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        let myListView = UIHostingController(rootView: MyListView())
        myListView.view.backgroundColor = .systemBackground
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        container.frame = CGRect(x: container.bounds.origin.x, y: container.bounds.origin.y, width: view.frame.width, height: view.frame.height)
        container.backgroundColor = .systemBackground
        view.addSubview(container)
        
        addChild(myListView)
        myListView.view.frame = container.bounds
        container.addSubview(myListView.view)
        myListView.didMove(toParent: self)
        
    }
    
    
    private func configureNavBar(){
        // navigation configuration
        self.title = "My List"
        
        // create searchbar
        let searchController = UISearchController(searchResultsController: SearchResultViewController())
        //configure the searchbar
        configureSearchBar(with: searchController)
        searchController.searchResultsUpdater = self
    }
    
    //configuration for the searchbar
    private func configureSearchBar(with searchController: UISearchController){
        searchController.searchBar.placeholder = "Enter a Movie title"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension MyListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchbar = searchController.searchBar
        
        guard let query = searchbar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 4,
              let resultsController = searchController.searchResultsController as? SearchResultViewController else {
            return
        }
        for movie in MoviesSingleton.sharedInstance.movies{
            if let title = movie.title{
                if title.contains(query) {
                    DispatchQueue.main.async {
                        if !resultsController.moviesResults.contains(where: {$0.id == movie.id}){
                            resultsController.moviesResults.append(movie)
                            resultsController.searchResultsCollectionView.reloadData()
                        }
                    }
                }
            }
        }
    }
}
