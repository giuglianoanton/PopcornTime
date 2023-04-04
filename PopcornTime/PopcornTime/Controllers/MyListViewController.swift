//
//  MyListViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit
import SwiftUI

class MyListViewController: UIViewController {
        
    var searchController = UISearchController()
    var container = UIView()
    
//        let myListView: UIHostingController = {
//            let myListView = UIHostingController(rootView: MyListView(myMovies: myMovies))
//            myListView.view.backgroundColor = .systemBackground
//            return myListView
//        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("myListViewController")
        MoviesSingleton.sharedInstance.printMovies()
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
