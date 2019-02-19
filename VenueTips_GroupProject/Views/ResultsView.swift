//
//  ResultsView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit
import MapKit

class ResultsView: UIView {

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()

    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        return mapView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
//        button.setImage("", for: .normal)
        return button
    }()

    
    lazy var listTableView: UITableView = {
        let listTableView = UITableView()
        return listTableView
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
        backgroundColor = .blue
        self.addSubview(searchBar)
        self.addSubview(mapView)
        self.addSubview(button)
        self.addSubview(listTableView)
        setConstraints()
    }

    func setConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        listTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true 
    }
    
    
    
}


