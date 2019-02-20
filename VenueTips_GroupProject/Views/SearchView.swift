//
//  SearchView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8893435346, green: 0.8817247842, blue: 0.8608004469, alpha: 1)
        return button
    }()
    
    
    
    
    lazy var venueSearchBar: UISearchBar = {
       let searchBar = UISearchBar()
       searchBar.placeholder = "Search Venue"
       return searchBar
    }()
    
    lazy var locationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Current Location"
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
        addSubview(cancelButton)
        addSubview(venueSearchBar)
        addSubview(locationSearchBar)
        addSubview(searchTableView)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        locationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),
            cancelButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cancelButton.trailingAnchor.constraint(equalTo:  safeAreaLayoutGuide.trailingAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: venueSearchBar.topAnchor),
            
            venueSearchBar.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 4),
            venueSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            venueSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            locationSearchBar.topAnchor.constraint(equalTo: venueSearchBar.bottomAnchor, constant: 0),
            locationSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            locationSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            searchTableView.topAnchor.constraint(equalTo: locationSearchBar.bottomAnchor, constant: 0),
            searchTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            searchTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            searchTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
}
