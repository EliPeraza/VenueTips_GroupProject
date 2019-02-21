//
//  SearchDetailedView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SearchDetailedView: UIView {
  
  lazy var venueImage: UIImageView = {
    let venueImage = UIImageView()
    return venueImage
  }()
  
    lazy var venueName: UILabel = {
      let venueName = UILabel()
      venueName.backgroundColor = .white
      venueName.textAlignment = .center
      return venueName
    }()
  
    lazy var venueAddress: UIButton = {
      let venueAddress = UIButton()
      venueAddress.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
      venueAddress.titleLabel?.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
      venueAddress.layer.cornerRadius = 2.0
      return venueAddress
    }()
  
    lazy var addCommentButton: UIButton = {
      let button = UIButton()
      button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
      button.titleLabel?.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
      return button
    }()
  
  
    lazy var commentsLabel: UILabel = {
      let commentsLabel = UILabel()
      commentsLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
      commentsLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
      return commentsLabel
    }()
 
  
    lazy var tipsCommentsTableView: UITableView = {
      var tableView = UITableView()
      tableView.frame = CGRect(x: 10, y: 10, width: 100, height: 200)
      return tableView
    }()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setConstraintsForSearchDetailedView()
    commonInit()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    setConstraintsForSearchDetailedView()
  }
}

extension SearchDetailedView {
  private func setConstraintsForSearchDetailedView() {
    setImageConstraints()
    venueNameConstraints()
    venueDirectionsConstraints()
    addTipButtonConstraints()
    commentsTitleLabel()
    tipsTableViewConstraints()
  }
  
  private func setImageConstraints() {
    addSubview(venueImage)
    venueImage.translatesAutoresizingMaskIntoConstraints = false
    venueImage.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 0.5).isActive = true
    venueImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    venueImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
    venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    
  }
  
  private func venueNameConstraints() {
   addSubview(venueName)
    venueName.translatesAutoresizingMaskIntoConstraints = false
    venueName.topAnchor.constraint(equalTo: venueImage.bottomAnchor, constant: 11).isActive = true
    venueName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive =  true
    venueName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
  }
  
  private func venueDirectionsConstraints() {
   addSubview(venueAddress)
    venueAddress.translatesAutoresizingMaskIntoConstraints = false
    venueAddress.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 88).isActive = true
    venueAddress.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -88).isActive = true
    venueAddress.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 11).isActive = true
  }
  
  private func addTipButtonConstraints() {
    addSubview(addCommentButton)
    addCommentButton.translatesAutoresizingMaskIntoConstraints = false
    addCommentButton.topAnchor.constraint(equalTo: venueAddress.bottomAnchor, constant: 11).isActive = true
    addCommentButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -88).isActive = true
    addCommentButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 88).isActive = true
  }
  
  private func commentsTitleLabel() {
   addSubview(commentsLabel)
    commentsLabel.translatesAutoresizingMaskIntoConstraints = false
    commentsLabel.topAnchor.constraint(equalTo: addCommentButton.bottomAnchor, constant: 11).isActive = true
    commentsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    commentsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
  }
  
  private func tipsTableViewConstraints() {
   addSubview(tipsCommentsTableView)
    tipsCommentsTableView.translatesAutoresizingMaskIntoConstraints = false
    tipsCommentsTableView.topAnchor.constraint(equalTo: commentsLabel.bottomAnchor, constant: 5).isActive = true
    tipsCommentsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    tipsCommentsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    tipsCommentsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 11).isActive = true
  }
  
  
  
}


