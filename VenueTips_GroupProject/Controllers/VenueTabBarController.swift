//
//  VenueTabBarController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class VenueTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTabBar()
  }
  
  private func setupTabBar() {
    
    let searchTabBarController = MainMenuController()
    searchTabBarController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 0)
    
    let favoriteTabBarController = FavoriteController()
    favoriteTabBarController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "add"), tag: 1)
    
    
    
    
    let tabBarList = [UINavigationController(rootViewController: searchTabBarController),
                      UINavigationController(rootViewController: favoriteTabBarController)]
    
   setViewControllers(tabBarList, animated: true)
    
  }
  
}
