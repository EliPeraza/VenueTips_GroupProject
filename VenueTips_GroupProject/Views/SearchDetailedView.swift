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
    venueName.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    return venueName
  }()
  
  lazy var venueAddress: UIButton = {
    let venueAddress = UIButton()
    venueAddress.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    venueAddress.titleLabel?.textColor = .black
    return venueAddress
  }()
  
  lazy var commentsLabel: UILabel = {
    let commentsLabel = UILabel()
    commentsLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    return commentsLabel
  }()
  
  lazy var addCommentButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.1619485294, green: 0.8127583182, blue: 0.9752420553, alpha: 1)
    button.titleLabel?.textColor = .black
    return button
  }()
  
  lazy var detailedCommentsTableView: UITableView = {
    var tableView = UITableView()
    tableView.frame = CGRect(x: 10, y: 10, width: 100, height: 200)
    return tableView
  }()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
    setConstraintsForSearchDetailedView()

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
    venueImageConstraints()
    venueNameConstraints()
    venueAddressConstraints()
    commentsLabelConstraints()
    detailedCommentsTableConstraints()
    addCommentButtonConstraints()
  }
  
  func venueImageConstraints() {
    self.addSubview(venueImage)
    venueImage.translatesAutoresizingMaskIntoConstraints = false
    venueImage.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 0.5).isActive = true
    venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    venueImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    venueImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
  }
  
  func addCommentButtonConstraints() {
    self.addSubview(addCommentButton)
    addCommentButton.translatesAutoresizingMaskIntoConstraints = false
    addCommentButton.topAnchor.constraint(equalTo: venueImage.bottomAnchor, constant: 11).isActive = true
    addCommentButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    addCommentButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    addCommentButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  func venueNameConstraints() {
    self.addSubview(venueName)
    venueName.translatesAutoresizingMaskIntoConstraints = false
    venueName.topAnchor.constraint(equalTo: addCommentButton.bottomAnchor, constant: 11).isActive = true
    venueName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    venueName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    venueName.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  func venueAddressConstraints() {
    self.addSubview(venueAddress)
    venueAddress.translatesAutoresizingMaskIntoConstraints = false
    venueAddress.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 11).isActive = true
    venueAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    venueAddress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    venueAddress.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  func commentsLabelConstraints() {
    self.addSubview(commentsLabel)
    commentsLabel.translatesAutoresizingMaskIntoConstraints = false
    commentsLabel.topAnchor.constraint(equalTo: venueAddress.bottomAnchor, constant: 11).isActive = true
    commentsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
    commentsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    commentsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  func detailedCommentsTableConstraints() {
    self.addSubview(detailedCommentsTableView)
    detailedCommentsTableView.translatesAutoresizingMaskIntoConstraints = false
    detailedCommentsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
    detailedCommentsTableView.topAnchor.constraint(equalTo: commentsLabel.bottomAnchor, constant: 0).isActive = true
    detailedCommentsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    detailedCommentsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
  }
}


