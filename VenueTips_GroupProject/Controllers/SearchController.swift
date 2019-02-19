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

  var categoriesTest = [CategoriesDetails]() {
    didSet {
      DispatchQueue.main.async {
        self.searchView.searchTableView.reloadData()
        print("These are the number of categories: \(self.categoriesTest.count)")
        
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchView.cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    view.addSubview(searchView)
    searchView.locationSearchBar.delegate = self
    searchView.venueSearchBar.delegate = self
    searchView.searchTableView.dataSource = self
    searchView.searchTableView.delegate = self
    searchView.searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchCell")
    
    getCategories()
  }
  
  @objc private func cancelButtonPressed() {
    dismiss(animated: true, completion: nil)
  }
  
  
  func getCategories() {
    CategoriesAPIClient.getCategories(location: "40.7,-74", date: "20190208") { (appError, categories) in
      if let appError = appError {
        print(appError)
      }
      if let categoriesData = categories {
        self.categoriesTest = categoriesData
        dump(self.categoriesTest)
      }
    }
  }
  
}

extension SearchController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categoriesTest.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = searchView.searchTableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
    
    let currentCategory = categoriesTest[indexPath.row]
    cell.textLabel?.text = currentCategory.name
    
    return cell
  }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultsCategory = categoriesTest[indexPath.row].name
        let vc = ViewControllers.SearchVC

        if let searchLocation = searchView.locationSearchBar.text {
            //To do: Segue here
        }
        if (searchView.locationSearchBar.text?.isEmpty)! {
//            print("Show alert")
            let alert = UIAlertController(title: "Please enter a location", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
}

extension SearchController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        var locationToSend = String()
        var venueToSend = String()
        let vc: ViewControllers = .SearchVC
        guard let venue = searchView.venueSearchBar.text,
            !venue.isEmpty,
        let searchTextEncoded =  venue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            else { return getCategories() }
        categoriesTest = categoriesTest.filter{ $0.name.contains(searchTextEncoded.capitalized) }
        venueToSend = venue
        guard let location = searchView.locationSearchBar.text,
                !location.isEmpty else {return}
            locationToSend = location
        
    }
}
