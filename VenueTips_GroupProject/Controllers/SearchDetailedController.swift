//
//  SearchDetailedController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchDetailedController: UIViewController {
    
    let request = MKDirections.Request()
    let locationManager = CLLocationManager()
    
    var venueInfoReceivedFromMain: VenueDetails?
    
    var imageReceivedFromMain: UIImage?
    var resultView = ResultsView()
    
    let searchDetailedView = SearchDetailedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchDetailedView)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        searchDetailedView.addCommentButton.addTarget(self, action: #selector(addTipButtonPressed), for: .touchUpInside)
        resultView.mapView.delegate = self
        searchDetailedView.venueAddress.addTarget(self, action: #selector(directionPressed), for: .touchUpInside)
        
        setupDetailed()
        
    }
    
    
    @objc func addTipButtonPressed() {
        let addTipController = AddTipControllerViewController()
        addTipController.venueID = venueInfoReceivedFromMain?.id ?? "no id"
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
        
        directionTrailCalling(request: direction(location: [coordinates]))
        
    }
    
    func direction(location: [CLLocationCoordinate2D]) -> MKDirections.Request {
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: (locationManager.location?.coordinate)!, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: location.last!, addressDictionary: nil))
        request.requestsAlternateRoutes = false
        request.transportType = .walking
        return request
    }
    
    func directionTrailCalling(request: MKDirections.Request){
        let direction = MKDirections(request: request)
        direction.calculate { (directions, error) in
            guard let directionFinallyGotten = directions else {return print(error!)}
            for location in directionFinallyGotten.routes{
                self.resultView.mapView.addOverlay(location.polyline)
                self.resultView.mapView.setVisibleMapRect(location.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    func setupDetailed() {
//        if searchDetailedView.tipsCommentsTableView.count = 0 {
//            searchDetailedView.commentsLabel.text = "Enter a Comment"
//        } else {
//            searchDetailedView.commentsLabel.text = "Comments by other users:"
//        }
        searchDetailedView.venueName.text = venueInfoReceivedFromMain?.name
        searchDetailedView.venueAddress.setTitle("Directions", for: .normal)
        searchDetailedView.addCommentButton.setTitle("Add a Comment", for: .normal)
        searchDetailedView.commentsLabel.text = "Comments by other users:"
        if let image = imageReceivedFromMain {
            searchDetailedView.venueImage.image = image
        } else {
            searchDetailedView.venueImage.image = UIImage(named: "placeholder")
            
        }
    }
    
}

extension SearchDetailedController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        polylineRenderer.strokeColor = UIColor.blue
        polylineRenderer.fillColor = UIColor.red
        polylineRenderer.lineWidth = 2
        return polylineRenderer
    }
}
