//
//  SearchControllerViewController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchView)
        searchView.searchTableView.dataSource = self
        searchView.searchTableView.delegate = self
        searchView.searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchCell")
    }

}

extension SearchController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchView.searchTableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
        cell.textLabel?.text = "Searched Venue"
    
        return cell
    }
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
