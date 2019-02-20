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
  
  let searchDetailedView = SearchDetailedView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(searchDetailedView)
    view.backgroundColor = .white
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))

    
    
    setupDetailed()
    
    
  }
  
  @objc func favoriteButtonPressed() {
    //TODO: Pull new controller with table view with categories to select where we are saving the venue
    //Call the 
  }
  
  @objc func cancelButtonPressed() {
    navigationController?.popViewController(animated: true)
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
