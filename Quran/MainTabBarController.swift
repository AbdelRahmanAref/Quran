//
//  MainTabBarController.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/29/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController{


    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple

        setupViewControllers()
    }

    //MARK:- Setup Functions
    func setupViewControllers(){
        viewControllers = [
            generateNavigationController(for: PodCastsSearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(for: PodCastsSearchController(), title: "Favorites", image: #imageLiteral(resourceName: "play-1")),
            generateNavigationController(for: PodCastsSearchController(), title: "Downloads", image: #imageLiteral(resourceName: "downloads"))
        ]
    }

    //MARK:- Helper Functions
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController{
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
