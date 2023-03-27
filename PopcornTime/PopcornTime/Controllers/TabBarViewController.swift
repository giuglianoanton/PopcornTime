//
//  ViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // create a navigation controller for each of the vcs
      let whatsNew =  UINavigationController(rootViewController: WhatsNewViewController())
      let myList =  UINavigationController(rootViewController: MyListViewController())


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        configureNavBarWhatsNew()
        // set the tabBar
        self.tabBar.backgroundColor = .systemBackground
        whatsNew.tabBarItem = UITabBarItem(title: "What's New", image: UIImage(systemName: "popcorn.fill"), tag: 0)
        myList.tabBarItem = UITabBarItem(title: "My List", image: UIImage(systemName: "heart.fill"), tag: 1)
        
        // set the tabBar items
        setViewControllers([whatsNew, myList], animated: true)
    }
    
    private func configureNavBarWhatsNew() {
             whatsNew.navigationBar.prefersLargeTitles = true
         }

    
}

