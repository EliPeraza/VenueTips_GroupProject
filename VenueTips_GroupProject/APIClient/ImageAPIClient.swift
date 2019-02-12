//
//  ImageAPIClient.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct ImageAPIClient {
  static func searchImageForVenue(venueID: String, date: String, completionHandler: @escaping (AppError?, [PhotoDetails]?) -> Void){
    
    let imageURLString = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=H02XVB2YYM3PCYFESXBGEFFI0A15HOYTK2BHLZBCHSUHUTVH&client_secret=XQGJPPQK51FL4YZRG412AMGU03PVZHPSCJHMVE5IAOXNCZGD&v=\(date)"
    
    print(imageURLString)
    NetworkHelper.shared.performDataTask(endpointURLString: imageURLString) { (appError, data) in
      if appError != nil {
        completionHandler(AppError.badURL("Bad URL"), nil)
      }
      if let data = data {
        do{
          let photoData = try JSONDecoder().decode(Image.self, from: data)
          completionHandler(nil, photoData.response.photos.items)
        }catch{
          completionHandler(AppError.jsonDecodingError(error), nil)
        }
      }
    }
  }
}
