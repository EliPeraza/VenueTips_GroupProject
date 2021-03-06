//
//  FavoritesDetailedView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/13/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class FavoritesDetailedView: UIView {


  lazy var favoriteVenuesTableView: UITableView = {
    var tableView = UITableView()
    tableView.frame = CGRect(x: 10, y: 10, width: 100, height: 200)
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    tableViewConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func tableViewConstraints() {
   addSubview(favoriteVenuesTableView)
    favoriteVenuesTableView.translatesAutoresizingMaskIntoConstraints = false
    favoriteVenuesTableView.frame = frame
  }
}
