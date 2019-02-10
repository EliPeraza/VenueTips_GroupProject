//
//  FavoriteView.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class FavoriteView: UIView {
  
  lazy var favoriteCollectionView: UICollectionView = {
    let favoriteLayout = UICollectionViewFlowLayout()
    favoriteLayout.itemSize = CGSize(width: 200, height: 300)
    favoriteLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    
    
    let favoriteCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: favoriteLayout)
    favoriteCollectionView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    
    return favoriteCollectionView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    favoriteViewSetup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //TODO: Ask group about using the conditional init that Alex uses?
  
}

extension FavoriteView {
  private func favoriteViewSetup() {
    favoriteColletionConstraints()
  }
  
  private func favoriteColletionConstraints() {
    addSubview(favoriteCollectionView)
    favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
    
    favoriteCollectionView.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 1).isActive = true
    favoriteCollectionView.centerYAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.centerYAnchor, multiplier: 1).isActive = true
    favoriteCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
    favoriteCollectionView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
    
    
    
  }
  
}
