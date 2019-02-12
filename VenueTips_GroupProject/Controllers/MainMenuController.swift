//
//  MainMenuController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/11/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class MainMenuController: UIViewController, UISearchBarDelegate{
    var mainView = MainView()
    var nearbyVenues = [VenueDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.exploreNearByCollectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        mainView.venueSearchBar.delegate = self
        mainView.exploreNearByCollectionView.dataSource = self
        mainView.exploreNearByCollectionView.delegate = self
                VenueAPIClient.searchForVenueAnyLocation(location: "Queens, NY", keyword: "tacos") { (appError, venues) in
                    if let appError = appError {
                        print(appError)
                    }
                    if let venues = venues{
                        self.nearbyVenues = venues
                    }
        
                }
                VenueAPIClient.searchForVenueNearBy(location: "40.7,-74") { (appError, venues) in
                    if let appError = appError {
                        print(appError)
                    }
                    if let venues = venues{
                        self.nearbyVenues = venues
                    }
                }
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearByCell", for: indexPath) as? NearByCollectionViewCell else {return UICollectionViewCell()}
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return  CGSize.init(width: collectionView.bounds.width * 0.75, height: collectionView.bounds.height * 0.75)
//    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchVC = SearchController()
        searchVC.modalPresentationStyle = .overCurrentContext
        present(searchVC, animated: true, completion: nil)
    }

}
