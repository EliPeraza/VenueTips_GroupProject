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
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setImageConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setImageConstraints() {
    addSubview(imageToShow)
    imageToShow.translatesAutoresizingMaskIntoConstraints = false
    imageToShow.frame = frame
  }
  
  
}
