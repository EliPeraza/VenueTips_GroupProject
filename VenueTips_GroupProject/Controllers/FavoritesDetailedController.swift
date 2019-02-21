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
  
    var favoriteVenues = [VenueToSave]() {
        didSet{
            DispatchQueue.main.async {
                self.favoritesDetailedView.favoriteVenuesTableView.reloadData()
            }
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    favoriteVenues = DataManager.getVenues(categoryName: categoryNamePassedFromFavoriteCollection)
    view.addSubview(favoritesDetailedView)
    favoritesDetailedView.favoriteVenuesTableView.delegate = self
    favoritesDetailedView.favoriteVenuesTableView.dataSource = self
  }

}

extension FavoritesDetailedController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favoriteVenues.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    

    
    let favoriteVenueToSet = favoriteVenues[indexPath.row]
    cell.textLabel?.text = favoriteVenueToSet.name

    
    return cell

  }
}
