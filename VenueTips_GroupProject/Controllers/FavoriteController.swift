//
//  FavoriteController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class FavoriteController: UIViewController {
  
  let favoriteView = FavoriteView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(favoriteView)
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    favoriteView.favoriteCollectionView.register(FavoriteCollectionCell.self, forCellWithReuseIdentifier: "FavoriteCollectionCell")
    
    favoriteView.favoriteCollectionView.dataSource = self
    favoriteView.favoriteCollectionView.delegate = self
    
    let addCategoryButton = UIBarButtonItem(title: "New Category", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addCategoryButtonPressed))
    self.navigationItem.rightBarButtonItem = addCategoryButton
    
  }
  
  @objc private func addCategoryButtonPressed() {
    
  }
  
}


extension FavoriteController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 60
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = self.favoriteView.favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionCell", for: indexPath) as? FavoriteCollectionCell else {return UICollectionViewCell()}
    
    cell.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    
    let venueID = "4bddccbe6198c9b67bb911ff"
    let date = "20190208"
  
    ImageAPIClient.searchImageForVenue(venueID: venueID, date: date) { (appError, PhotoDetails) in

      let url = "\(PhotoDetails?.first?.prefix)original\(PhotoDetails?.first?.suffix)"
      ImageHelper.fetchImageFromNetwork(urlString: url, completion: { (appError, imageToSet) in
        if let appError = appError {
          print(appError.errorMessage())
        }
        if let imageToSet = imageToSet {
         cell.imageToShow.image = imageToSet
        }
      })
    }
    
    
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize.init(width: 120, height: 120)
    
  }
  
}
