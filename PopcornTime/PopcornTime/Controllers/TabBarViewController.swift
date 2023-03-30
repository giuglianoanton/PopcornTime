//
//  ViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit
import SwiftUI

class TabBarViewController: UITabBarController {
    
    //myMovies List
//    var myMovieList: MyList = MyList()
    
    // create a navigation controller for each of the vcs
    var whatsNew =  UINavigationController(rootViewController: WhatsNewViewController())
    let myList =  UINavigationController(rootViewController: MyListViewController())
    //      let myList =  UIHostingController(rootView: MyListView())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        configureNavBar()
        // set the tabBar
        self.tabBar.backgroundColor = .systemBackground
        whatsNew.tabBarItem = UITabBarItem(title: "What's New", image: UIImage(systemName: "popcorn.fill"), tag: 0)
        myList.tabBarItem = UITabBarItem(title: "My List", image: UIImage(systemName: "heart.fill"), tag: 1)
        
        // set the tabBar items
        setViewControllers([whatsNew, myList], animated: true)
    }
    
    private func configureNavBar() {
        whatsNew.navigationBar.prefersLargeTitles = true
        myList.navigationBar.prefersLargeTitles = true
        
        
//        guard let myMovies = myMovieList.myMovies else {return}
        
        
//        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "WhatsNewViewController") as! WhatsNewViewController
//        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "MyListViewController") as! MyListViewController
//        
//       
//        
//        vc1.myMovies = myMovies
//        vc2.myMovies = myMovies
        
       
    }
    
    
}

