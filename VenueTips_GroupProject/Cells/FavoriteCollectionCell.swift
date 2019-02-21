//
//  FavoriteCollectionCell.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/10/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class FavoriteCollectionCell: UICollectionViewCell {
  
  lazy var imageToShow: UIImageView = {
    var image = UIImageView()
    return image
  }()
  
  lazy var title: UILabel = {
   var label = UILabel()
    label.numberOfLines = 3
    label.textAlignment = .center
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 22)
    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setImageConstraints()
    setLabelConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setImageConstraints() {
    addSubview(imageToShow)
    imageToShow.translatesAutoresizingMaskIntoConstraints = false
    imageToShow.frame = frame
  }
  
  func setLabelConstraints() {
   addSubview(title)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.5 ).isActive = true
    title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    title.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true 
  }
  
  
}
