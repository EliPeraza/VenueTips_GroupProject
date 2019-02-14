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

    let thisTest = "Test"
  
  var categoriesTest = [CategoriesDetails]() {
    didSet {
      DispatchQueue.main.async {
        self.favoriteView.favoriteCollectionView.reloadData()
        print("These are the number of categories: \(self.categoriesTest.count)")

      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(favoriteView)
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    favoriteView.favoriteCollectionView.register(FavoriteCollectionCell.self, forCellWithReuseIdentifier: "FavoriteCollectionCell")
    
    favoriteView.favoriteCollectionView.dataSource = self
    favoriteView.favoriteCollectionView.delegate = self
    
    let addCategoryButton = UIBarButtonItem(title: "New Category", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addCategoryButtonPressed))
    self.navigationItem.rightBarButtonItem = addCategoryButton
    
    getCategories()
    
  }
  
  @objc private func addCategoryButtonPressed() {
    
  }
  
  func getCategories() {
    CategoriesAPIClient.getCategories(location: "40.7,-74", date: "20190208") { (appError, categories) in
      if let appError = appError {
        print(appError)
      }
      if let categoriesData = categories {
       self.categoriesTest = categoriesData
        dump(self.categoriesTest)
      }
    }
  }
  
  
  
}


extension FavoriteController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoriesTest.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = self.favoriteView.favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionCell", for: indexPath) as? FavoriteCollectionCell else {return UICollectionViewCell()}
    
    let currentCategory = categoriesTest[indexPath.row]
    
    cell.title.text = currentCategory.name
    cell.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize.init(width: 120, height: 120)
    
  }
  
}
