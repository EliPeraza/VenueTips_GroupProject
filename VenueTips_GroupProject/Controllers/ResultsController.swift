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
    var resultsView = ResultsView()
    var mapView = MKMapView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resultsView)
        view.backgroundColor = #colorLiteral(red: 0.2925806642, green: 0.06769999117, blue: 0.2471010089, alpha: 1)

    }
}





