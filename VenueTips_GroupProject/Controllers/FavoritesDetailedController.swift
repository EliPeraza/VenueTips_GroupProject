//
//  FavoritesDetailedController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/14/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class FavoritesDetailedController: UIViewController {
  
  var categoryNamePassedFromFavoriteCollection = ""

  var favoritesDetailedView = FavoritesDetailedView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    view.addSubview(favoritesDetailedView)
    favoritesDetailedView.favoriteVenuesTableView.delegate = self
    favoritesDetailedView.favoriteVenuesTableView.dataSource = self

  }
  
}

extension FavoritesDetailedController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    
    cell.backgroundColor = .clear
    cell.textLabel?.text = categoryNamePassedFromFavoriteCollection
    
    return cell

  }
}
