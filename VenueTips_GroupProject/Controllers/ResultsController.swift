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
enum ScreenState {
    case on
    case off
}
class ResultsController: UIViewController {
    private var resultsView = ResultsView()
    private var sceenState: ScreenState = .off
    private var vc: ViewControllers?
    private var location = String()
    private var category = String()
    private var coordinates = Bool()

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
        resultsView.button.addTarget(self, action: #selector(pullViewButtonPressed), for: .touchUpInside)
        if vc == .MainVC {
        setupMap()
            getVenues(location: location, keyword: category, date: "20190219")
        } else {
            if coordinates {
            getVenues(location: location, keyword: category, date: "20190219")
            } else {
                getVenuesByLocation()
            }
            getVenues(location: location, keyword: category, date: DateHelper.formatISOToDate(dateString: "MM/dd/yyyy"))
        }
    }
    @objc func pullViewButtonPressed() {
        if sceenState == .off {
            sceenState = .on
            resultsView.button.setImage(UIImage(named: "icons8-chevron_down"), for: .normal)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                print(self.resultsView.listTableView.frame)
                self.resultsView.listTableView.frame = CGRect(x: self.self.resultsView.listTableView.frame.origin.x, y: self.resultsView.listTableView.frame.origin.y, width: self.resultsView.listTableView.frame.width, height: self.resultsView.frame.height)
                
            })
        } else {
            sceenState = .off
            resultsView.button.setImage(UIImage(named: "icons8-chevron_up"), for: .normal)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.resultsView.listTableView.frame = CGRect(x: 0.0, y: self.resultsView.listTableView.frame.origin.y + self.resultsView.frame.height, width: self.resultsView.listTableView.frame.width, height: 0)
            })
        }
    }
    
    init(vc: ViewControllers,location: String, category: String,coordinates: Bool){
        super.init(nibName: nil, bundle: nil)
        self.vc = vc
        self.location = location
        self.category = category
        self.coordinates = coordinates
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
    func getVenuesByLocation() {
        VenueAPIClient.searchForVenueAnyLocation(location: location, keyword: category, date: "20190219") { (appError, venues) in
            if let appError = appError {
                print(appError)
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
        getVenues(location: location, keyword: text, date: DateHelper.formatISOToDate(dateString: "MM/dd/yyyy"))
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


