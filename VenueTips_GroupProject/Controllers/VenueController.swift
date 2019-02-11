//
//  VenueController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class VenueController: UIViewController {
    var nearbyVenues = [VenueDetails]() {
        didSet {
            dump(nearbyVenues)
        }
    }
    let venueView = VenueView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(venueView)
        VenueAPIClient.searchForVenueNearBy(location: "40.7,-74") { (appError, venues) in
            if let appError = appError {
                print(AppError.errorMessage(appError))
            }
            if let venues = venues{
                self.nearbyVenues = venues
            }
        }
        
    }
    


}
