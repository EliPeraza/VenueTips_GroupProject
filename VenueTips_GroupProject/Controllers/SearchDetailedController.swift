//
//  SearchDetailedController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SearchDetailedController: UIViewController {
  
  var venueInfoReceivedFromMain: VenueDetails?
  var imageReceivedFromMain: UIImage?
  
  var searchDetailedView = SearchDetailedView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(searchDetailedView)
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add Comment", style: .plain, target: self, action: #selector(addCommentPressed))
    
    setupDetailed()
    
  }
  
  @objc func favoriteButtonPressed() {
    
  }
  
  @objc func addCommentPressed() {
    
  }
  
  func setupDetailed() {
    searchDetailedView.venueName.text = venueInfoReceivedFromMain?.name
    if let address = venueInfoReceivedFromMain?.location {
      
    searchDetailedView.venueAddress.setTitle("Directions", for: .normal)
    }
    
    if let image = imageReceivedFromMain {
      searchDetailedView.venueImage.image =  image
    }
    
    
  }
  
}
