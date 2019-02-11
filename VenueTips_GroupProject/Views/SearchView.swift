//
//  SearchView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SearchView: UIView {

    lazy var venueSearchBar: UISearchBar = {
       let searchBar = UISearchBar()
       searchBar.placeholder = "Search Venue"
       return searchBar
    }()
    
    lazy var locationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Enter Location"
        return searchBar
    }()
    
    let searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(venueSearchBar)
        addSubview(locationSearchBar)
        addSubview(searchTableView)
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        locationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            venueSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            venueSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            venueSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            locationSearchBar.topAnchor.constraint(equalTo: venueSearchBar.bottomAnchor, constant: 0),
            locationSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            locationSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            searchTableView.topAnchor.constraint(equalTo: locationSearchBar.bottomAnchor, constant: 4),
            searchTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            searchTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            searchTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
}
