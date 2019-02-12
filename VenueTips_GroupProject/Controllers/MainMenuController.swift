//
//  MainMenuController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/11/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class MainMenuController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var mainView = MainView()
    
    var nearbyVenues = [VenueDetails]() {
        didSet {
            DispatchQueue.main.async {
                dump(self.nearbyVenues)
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
        //    VenueAPIClient.searchForVenueAnyLocation(location: "Queens, NY", keyword: "tacos") { (appError, venues) in
        //      if let appError = appError {
        //        print(appError)
        //      }
        //      if let venues = venues{
        //        self.nearbyVenues = venues
        //      }
        //
        //    }
        VenueAPIClient.searchForVenueNearBy(location: "40.7,-74") { (appError, venues) in
            if let appError = appError {
                print(appError)
            }
            if let venues = venues{
                self.nearbyVenues = venues
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nearbyVenues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainViewCell", for: indexPath) as? MainViewCell else {print("No Cell")
            return UICollectionViewCell()}
        
        let currentVenue = nearbyVenues[indexPath.row]
        
        cell.venueNameLabel.text = currentVenue.name
        cell.venueAddressLabel.text = currentVenue.location.address
        
        ImageAPIClient.searchImageForVenue(venueID: currentVenue.id, date: "20190212") { (appError, photoDetail) in
            if let appError = appError {
                print(appError)
            }
            if let photoDetail = photoDetail {
                if let photodetail = photoDetail.first{
                    let url = "\(photodetail.prefix)original\(photodetail.suffix)"
                    ImageHelper.fetchImageFromNetwork(urlString: url, completion: { (appError, photo) in
                        if let appError = appError {
                            print(appError)
                        }
                        if let photo = photo {
                            cell.venueImage.image = photo
                        }
                    })
                } else {
                    print("photo detail is nil")
                }
            }
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize.init(width: collectionView.bounds.width * 0.75, height: collectionView.bounds.height * 0.75)
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchVC = SearchController()
        searchVC.modalPresentationStyle = .overCurrentContext
        present(searchVC, animated: true, completion: nil)
    }
    
}
