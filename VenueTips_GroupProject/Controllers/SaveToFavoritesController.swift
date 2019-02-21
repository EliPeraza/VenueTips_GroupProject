//
//  SaveToFavoritesController.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/19/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

class SaveToFavoritesController: UIViewController {
    let saveToFavoritesView = SaveToFavoritesView()
    var venueName = String()
    var favoriteCategories = DataManager.getCategories(fileName: DataManager.categoriesFileName){
        didSet {
            DispatchQueue.main.async {
                self.saveToFavoritesView.favoriteCategoryTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let addCategoryButton = UIBarButtonItem(title: "New Category", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addCategoryButtonPressed))
        self.navigationItem.rightBarButtonItem = addCategoryButton
        saveToFavoritesView.favoriteCategoryTableView.delegate = self
        saveToFavoritesView.favoriteCategoryTableView.dataSource = self
        view.addSubview(saveToFavoritesView)
    }
    func reload(){
        favoriteCategories = DataManager.getCategories(fileName: DataManager.categoriesFileName)
        saveToFavoritesView.favoriteCategoryTableView.reloadData()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        saveToFavoritesView.favoriteCategoryTableView.reloadData()
        favoriteCategories = DataManager.getCategories(fileName: DataManager.categoriesFileName)
        
    }
    @objc private func addCategoryButtonPressed() {
        showAlert()
    }
    func showAlert() {
        let alert = UIAlertController(title: "Enter Category Name", message: nil, preferredStyle: .alert)
        alert.addTextField { (texField) in
            texField.placeholder = "E.g Tacos or Yoga"
        }
        let ok = UIAlertAction(title: "Ok", style: .default) { (done) in
            if let categoryName =  alert.textFields?.first?.text {
                let categoryToSave = CategoryToSave.init(categoryName: categoryName)
                DataManager.addCatergory(fileName: DataManager.categoriesFileName, category: categoryToSave)
                self.reload()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
}
extension SaveToFavoritesController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCategoriesCell", for: indexPath) as? FavoriteCategoriesTableViewCell else {print("No cell found")
            return UITableViewCell()
        }
        let favoriteCategoryToSet = favoriteCategories[indexPath.row]
        cell.textLabel?.text = favoriteCategoryToSet.categoryName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venueCategory = favoriteCategories[indexPath.row].categoryName
        let venueToSave = VenueToSave(name: venueName)
        DataManager.addVenue(categoryName: venueCategory, venue: venueToSave)
        let alert = UIAlertController(title: "Venue Saved!", message: "Venue saved to \(venueCategory)", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    
}
