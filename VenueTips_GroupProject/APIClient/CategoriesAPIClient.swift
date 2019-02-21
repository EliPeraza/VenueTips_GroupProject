//
//  CategoriesAPIClient.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/13/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation





struct CategoriesAPIClient {
  static func getCategories(location: String, date: String, completionHandler: @escaping (AppError?, [CategoriesDetails]?) -> Void){
    
    let categoriesURL = "https://api.foursquare.com/v2/venues/categories?\(location)&client_id=\(APIKeys.clientID)&client_secret=\(APIKeys.clientSecret)&v=\(date)"
    
    NetworkHelper.shared.performDataTask(endpointURLString: categoriesURL) { (appError, data) in
      if appError != nil {
        completionHandler(AppError.badURL("Bad URL"), nil)
      }
      if let data = data {
        do{
          let categoriesData = try JSONDecoder().decode(Categories.self, from: data)
          completionHandler(appError, categoriesData.response.categories)
        }catch{
          completionHandler(AppError.jsonDecodingError(error), nil)
        }
      }
    }
  }
}
