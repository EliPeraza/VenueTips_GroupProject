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
    favoriteLayout.itemSize = CGSize(width: 120, height: 120)
    favoriteLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    
    
    let favoriteCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: favoriteLayout)
    favoriteCollectionView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
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
    
    favoriteCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    favoriteCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    favoriteCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    favoriteCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    
  }
  
}
