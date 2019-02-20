//
//  SearchDetailedController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit
import MapKit
class SearchDetailedController: UIViewController {
  
  var venueInfoReceivedFromMain: VenueDetails?
  
  var imageReceivedFromMain: UIImage?
  
  let searchDetailedView = SearchDetailedView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(searchDetailedView)
    view.backgroundColor = .white
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))

    searchDetailedView.addCommentButton.addTarget(self, action: #selector(addTipButtonPressed), for: .touchUpInside)
    
    searchDetailedView.venueAddress.addTarget(self, action: #selector(directionPressed), for: .touchUpInside)
    
    setupDetailed()
    
  }
  
  @objc func addTipButtonPressed() {
    let addTipController = AddTipControllerViewController()
    navigationController?.pushViewController(addTipController, animated: true)
  }
    @objc func directionPressed() {
        openMaps()
    }
  @objc func favoriteButtonPressed() {
    //TODO: Pull new controller with table view with categories to select where we are saving the venue
    //Call the
    let saveToFavoritesVC = SaveToFavoritesController()
    saveToFavoritesVC.venueName = venueInfoReceivedFromMain!.name
    navigationController?.pushViewController(saveToFavoritesVC, animated: true)
  }
  
  @objc func cancelButtonPressed() {
    navigationController?.popViewController(animated: true)
  }
    func openMaps() {
            let latitude: CLLocationDegrees = (venueInfoReceivedFromMain?.location.lat)!
            let longitude: CLLocationDegrees = (venueInfoReceivedFromMain?.location.lng)!

            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = venueInfoReceivedFromMain?.name
            mapItem.openInMaps(launchOptions: options)
    }
  func setupDetailed() {
    searchDetailedView.venueName.text = venueInfoReceivedFromMain?.name
    searchDetailedView.venueAddress.setTitle("Directions", for: .normal)
    searchDetailedView.addCommentButton.setTitle("Add a tip", for: .normal)
    searchDetailedView.commentsLabel.text = "Tips by other users:"
    if let image = imageReceivedFromMain {
      searchDetailedView.venueImage.image = image
    } else {
     searchDetailedView.venueImage.image = UIImage(named: "placeholder")
    }
}
  
}
