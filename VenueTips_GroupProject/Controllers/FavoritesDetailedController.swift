//
//  FavoritesDetailedController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/14/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class FavoritesDetailedController: UIViewController {
  
  var testLabel = ""

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
    
    cell.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.7921568627, blue: 0.7647058824, alpha: 1)
    cell.textLabel?.text = testLabel
    
    return cell
  }
}
