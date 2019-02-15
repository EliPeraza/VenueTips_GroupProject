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
  
  var categories = DataManager.getCategories(fileName: DataManager.categoriesFileName) {
    didSet {
      DispatchQueue.main.async {
        self.favoriteView.favoriteCollectionView.reloadData()

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
    
//    getCategories()
    
  }

  
  @objc private func addCategoryButtonPressed() {
    showAlert()
  }
  
<<<<<<< HEAD
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
=======
//  func getCategories() {
//    CategoriesAPIClient.getCategories(location: "40.7,-74", date: "20190208") { (appError, categories) in
//      if let appError = appError {
//        print(appError)
//      }
//      if let categoriesData = categories {
//       self.categoriesTest = categoriesData
//        dump(self.categoriesTest)
//      }
//    }
//  }
  
    func showAlert() {
        let alert = UIAlertController(title: "Enter Category Name", message: nil, preferredStyle: .alert)
        alert.addTextField { (texField) in
            texField.text = "E.g Tacos or Yoga"
        }
        let ok = UIAlertAction(title: "Ok", style: .default) { (done) in
            if let categoryName =  alert.textFields?.first?.text {
                let categoryToSave = CategoryToSave.init(categoryName: categoryName)
                DataManager.addCatergory(fileName: DataManager.categoriesFileName, category: categoryToSave)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
  
  
>>>>>>> 01c3dc1194e0230a0c7925a76ef0c3a1b51fe1fa
}


extension FavoriteController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = self.favoriteView.favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionCell", for: indexPath) as? FavoriteCollectionCell else {return UICollectionViewCell()}
    
    let currentCategory = categories[indexPath.row]
    
    cell.title.text = currentCategory.categoryName
    cell.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize.init(width: 120, height: 120)
    
  }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(categories[indexPath.row].categoryName)
    }
}
