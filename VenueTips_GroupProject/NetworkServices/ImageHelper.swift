//
//  ImageHelper.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import UIKit

//ADDED FROM NYTBest Sellers - Need to customize to use...

//final class ImageHelper {
//  private init() {}
//
//  private static var cache = NSCache<NSString, UIImage>()
//
//  static func fetchImageFromNetwork(urlString: String, completion: @escaping (AppError?, UIImage?) -> Void) {
//    NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data ) in
//      if let appError = appError {
//        completion(appError, nil)
//      } else if let data = data {
//        DispatchQueue.global().async {
//          if let image = UIImage(data: data) {
//            cache.setObject(image, forKey: urlString as NSString)
//            DispatchQueue.main.async {
//              completion(nil, image)
//            }
//          }
//        }
//      }
//    }
//  }
//
//  static func fetchImageFromCache(urlString: String) -> UIImage? {
//    return cache.object(forKey: urlString as NSString)
//  }
//}
//
//
////Added from Weather app:
//
//import Foundation
//
//
//final class ImagesClientAPI {
//
//  static func searchImage(selectedCityName: String, completionHandler: @escaping (AppError?, [ImageDetailedInfo]?) -> Void){
//
//    let city = selectedCityName.replacingOccurrences(of: " ", with: "+")
//
//    let urlString = "https://pixabay.com/api/?key=\(Constants.imageAPIKey)&q=\(city)&image_type=photo"
//
//    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
//
//      if let appError = appError {
//        completionHandler(appError, nil)
//      }
//      guard let response = httpResponse,
//        (200...299).contains(response.statusCode) else {
//          let statusCode = httpResponse?.statusCode ?? -999
//          completionHandler(AppError.badStatusCode(String(statusCode)), nil)
//          return
//      }
//      if let data = data {
//        do {
//          let imageData = try JSONDecoder().decode(ImageModel.self, from: data)
//          completionHandler(nil, imageData.hits)
//        } catch {
//          completionHandler(AppError.decodingError(error), nil)
//        }
//      }
//    }
//  }
//
//}
