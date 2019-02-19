//
//  ResultsController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ResultsController: UIViewController {
    private var resultsView = ResultsView()

    private var vc: ViewControllers?
    private var location = String()
    private var category = String()
    

    private var annotations =  [MKAnnotation]()
    var venues = [VenueDetails]() {
        didSet{
            DispatchQueue.main.async {
                self.addAnnotation()
                
            }
        }
    }
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resultsView)
        locationManager.delegate = self
        resultsView.listTableView.dataSource = self
        resultsView.listTableView.delegate = self
        resultsView.searchBar.delegate = self
        resultsView.mapView.delegate = self
        if vc == .MainVC{
        setupMap()
            getVenues(location: location, keyword: category, date: "20190219")
        }
    }


    init(vc: ViewControllers,location: String, category: String){
        super.init(nibName: nil, bundle: nil)
        self.vc = vc
        self.location = location
        self.category = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupMap (){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            // we need to say how accurate the data should be
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // closest location accuracy
            locationManager.startUpdatingLocation()
            resultsView.mapView.showsUserLocation = true //blue dot on map
        } else {
            locationManager.requestWhenInUseAuthorization()// this is only while the app is unlocked
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            resultsView.mapView.showsUserLocation = true
        }
    }
    func getVenues(location: String, keyword: String, date: String) {
        VenueAPIClient.searchForVenueNearBy(location: location, keyword: keyword, date: date) { (appError, venues) in
            if let error = appError {
                print(error)
            }
            if let venues = venues {
                self.venues = venues
            }
            
        }
    }
    func addAnnotation() {
        resultsView.mapView.removeAnnotations(annotations)
        
        for venue in venues{
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
            annotation.coordinate = coordinate
            annotation.title = venue.name
            annotations.append(annotation)
        }
        resultsView.mapView.showAnnotations(annotations, animated: true)
    }
}

extension ResultsController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
        //TO DO: CREATE A CELL FILE
    }
}

extension ResultsController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let currentLocation = resultsView.mapView.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500) //the lat and log is the zoom
        resultsView.mapView.setRegion(myCurrentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {return}
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500) //the lat and log is the zoom
        resultsView.mapView.setRegion(myCurrentRegion, animated: true)
    }
}

extension ResultsController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
        getVenues(location: location, keyword: text, date: "20190219")
        }
    }
}

extension ResultsController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let name = view.annotation!.title!
        let filterVenue = venues.filter{$0.name == name!}
        let venueToSend = filterVenue.first!
        print(venueToSend.name)
        //TO DO: SEND FILTERED VENUE TO DETAIL
        
        
    }
}


