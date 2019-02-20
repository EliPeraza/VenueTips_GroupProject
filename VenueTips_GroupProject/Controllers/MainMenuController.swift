//
//  MainMenuController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/11/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit
import MapKit

enum ViewControllers{
  case MainVC
  case SearchVC
}
enum MainCategories: String, CaseIterable {

    case Lunch = "Lunch"
    case Breakfast = "Breakfast"
    case Coffee = "Coffee"
    case Bar = "Bars"
    case Parks = "Parks"
    case Gyms = "Gyms"
}


class MainMenuController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  var mainView = MainView()
  let locationManager = CLLocationManager()
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
    getLocationVenues()
    addActionToButtons()
    searchForCurrentLocation()
    locationManager.delegate = self
    mainView.venueSearchBar.delegate = self
    mainView.exploreNearByCollectionView.dataSource = self
    mainView.exploreNearByCollectionView.delegate = self

    
  }
  func addActionToButtons(){
    mainView.buttons.forEach {$0.addTarget(self, action: #selector(categoryButtonPressed(sender:)), for: .touchUpInside)}
  }
  @objc func categoryButtonPressed(sender: UIButton) {
    print("\(MainCategories.allCases[sender.tag])")
    guard let currentLocation = locationManager.location?.coordinate  else {print("No location found")
      return}
    let myCurrentRegion = "\(currentLocation.latitude),\(currentLocation.longitude)"
    let category = MainCategories.allCases[sender.tag]
    let vc: ViewControllers = .MainVC
    let resultsController = ResultsController(vc: vc, location: myCurrentRegion, category: category.rawValue, coordinates: true)
    navigationController?.pushViewController(resultsController, animated: true)
  }
  func getLocationVenues(){
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
      
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    } else {
      locationManager.requestWhenInUseAuthorization()
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return nearbyVenues.count
  }
  func searchForCurrentLocation() {
    if let currentLocation = locationManager.location?.coordinate{
      let myCurrentRegion = "\(currentLocation.latitude),\(currentLocation.longitude)"
      VenueAPIClient.searchForVenueNearBy(location: myCurrentRegion, keyword: nil, date: "20190219") { (appError, venueDetail) in
        if let appError = appError {
          print(appError)
        } else if let venueDetail = venueDetail {
          self.nearbyVenues = venueDetail
        }
      }
    }
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainViewCell", for: indexPath) as? MainViewCell else {print("No Cell")
      return UICollectionViewCell()}
    
    let currentVenue = nearbyVenues[indexPath.row]
    
    cell.venueNameLabel.text = currentVenue.name
    cell.venueAddressLabel.text = currentVenue.location.address
    //TO DO: GET DATE
    ImageAPIClient.searchImageForVenue(venueID: currentVenue.id, date: "20190219") { (appError, photoDetail) in
      if let appError = appError {
        print(appError)
      }
      if let photoDetail = photoDetail {
        if let photodetail = photoDetail.first{
          let url = "\(photodetail.prefix)original\(photodetail.suffix)"
            if let image = ImageHelper.fetchImageFromCache(urlString: url){
                DispatchQueue.main.async {
                    cell.venueImage.image = image
                }
            } else {
          ImageHelper.fetchImageFromNetwork(urlString: url, completion: { (appError, photo) in
            if let appError = appError {
              print(appError)
            }
            if let photo = photo {
              cell.venueImage.image = photo
            }
          })
        }
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
    searchBar.resignFirstResponder()
    searchVC.segueDelegate = self
    present(searchVC, animated: true, completion: nil)
//    let searchController = SearchController()
//    navigationController?.pushViewController(searchController, animated: true)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    guard let cell = collectionView.cellForItem(at: indexPath) as? MainViewCell else {
      print("No Cell")
      return}
    
    let venueToSegue = nearbyVenues[indexPath.row]
    
    
    let searchDetailedController = SearchDetailedController()
    
    searchDetailedController.imageReceivedFromMain = cell.venueImage.image
    searchDetailedController.venueInfoReceivedFromMain = venueToSegue
    
    navigationController?.pushViewController(searchDetailedController, animated: true)
    
  }
  
  
}
extension MainMenuController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    searchForCurrentLocation()
    
    //        let currentLocation = mapView.userLocation
    //        mapView.setRegion(myCurrentRegion, animated: true)
  }
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        guard let currentLocation = locations.last else { return }
    //        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    //        mapView.setRegion(myCurrentRegion, animated: true)
  }
}

extension MainMenuController: SegueDelegate {
    func prepareForSegue(vc: ViewControllers, location: String, keyword: String) {
        
        if location == "Current Location" {
            var locationToSend = String()
            if let currentLocation = locationManager.location?.coordinate{
               locationToSend = "\(currentLocation.latitude),\(currentLocation.longitude)"
                let resultVC = ResultsController(vc: vc, location: locationToSend, category: keyword,coordinates: true)
                navigationController?.pushViewController(resultVC, animated: true)
            }
        } else {
            let resultVC = ResultsController(vc: vc, location: location, category: keyword, coordinates: false)
            navigationController?.pushViewController(resultVC, animated: true)
        }
        
    }
}
