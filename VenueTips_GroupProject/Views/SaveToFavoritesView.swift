//
//  SaveToFavoritesView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/19/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SaveToFavoritesView: UIView {

    lazy var favoriteCategoryTableView: UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupTableView()
        favoriteCategoryTableView.register(FavoriteCategoriesTableViewCell.self, forCellReuseIdentifier: "FavoriteCategoriesCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView(){
        addSubview(favoriteCategoryTableView)
        favoriteCategoryTableView.translatesAutoresizingMaskIntoConstraints = false
        favoriteCategoryTableView.frame = frame
    }


}
