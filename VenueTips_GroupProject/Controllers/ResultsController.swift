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
    private let date = DateHelper.formatISOToDate(dateString: "yyyyMMdd")
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
                self.resultsView.listTableView.reloadData()
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
        setupMap()
        if vc == .MainVC {
            getVenues(location: location, keyword: category, date: date)
        } else {
            if coordinates {
                getVenues(location: location, keyword: category, date: date)
            } else {
                getVenuesByLocation()
            }

        }
    }
    @objc func pullViewButtonPressed() {
        if sceenState == .off {
            sceenState = .on
            resultsView.button.setImage(UIImage(named: "icons8-chevron_down"), for: .normal)
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                print(self.resultsView.listTableView.frame)
                self.resultsView.listTableView.frame = CGRect(x: self.resultsView.listTableView.frame.origin.x, y: self.resultsView.listTableView.frame.origin.y, width: self.resultsView.listTableView.frame.width, height: -(self.resultsView.safeAreaLayoutGuide.layoutFrame.height - self.resultsView.searchBar.frame.height))
            })
        } else {
            sceenState = .off
            resultsView.button.setImage(UIImage(named: "icons8-chevron_up"), for: .normal)
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.resultsView.listTableView.frame = CGRect(x: 0.0, y: self.resultsView.safeAreaLayoutGuide.layoutFrame.origin.y + self.resultsView.safeAreaLayoutGuide.layoutFrame.height, width: self.resultsView.listTableView.frame.width, height: 0)
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
                let alert = UIAlertController.init(title: "Invalid Venue", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                    alert.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            if let venues = venues {
                self.venues = venues
                if self.venues.count == 0 {
                    let alert = UIAlertController.init(title: "Invalid Venue", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                        alert.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
    func getVenuesByLocation() {
        VenueAPIClient.searchForVenueAnyLocation(location: location, keyword: category, date: date) { (appError, venues) in
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
        annotations.removeAll()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VenueListCell", for: indexPath) as? VenueListCell else {
            print("No cell")
            return UITableViewCell()
        }
        let venueToSet = venues[indexPath.row]
        cell.nameLabel.text = venueToSet.name
        cell.addressLabel.text = venueToSet.location.address
        ImageAPIClient.searchImageForVenue(venueID: venueToSet.id, date: date) { (appError, photoDetail) in
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
                                cell.venueImage.image = UIImage(named: "placeholder")
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venueToSend = venues[indexPath.row]
        let detailVC = SearchDetailedController()
        detailVC.venueInfoReceivedFromMain = venueToSend
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

extension ResultsController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let currentLocation = resultsView.mapView.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000) //the lat and log is the zoom
        resultsView.mapView.setRegion(myCurrentRegion, animated: true)
    }

}

extension ResultsController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            getVenues(location: location, keyword: text, date: date)
            getVenues(location: location, keyword: text, date: date)
        getVenues(location: location, keyword: text, date: date)
        }
    }
}
 
extension ResultsController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let name = view.annotation!.title!
        let filterVenue = venues.filter{$0.name == name!}
        let venueToSend = filterVenue.first!
        let detailVC = SearchDetailedController()
        //        detailVC.modalPresentationStyle = .overCurrentContext
        detailVC.venueInfoReceivedFromMain = venueToSend
        navigationController?.pushViewController(detailVC, animated: true)
        //        present(detailVC, animated: true, completion: nil)
        //TO DO: SEND FILTERED VENUE TO DETAIL
    }
}


