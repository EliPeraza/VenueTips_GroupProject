//
//  VenueAPIClient.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct VenueAPIClient {
    
    static func searchForVenueNearBy(location: String,keyword: String?,date: String,completionHandler: @escaping (AppError?, [VenueDetails]?) -> Void){
        var url = String()
        if let keyword = keyword {
            url = "https://api.foursquare.com/v2/venues/search?ll=\(location)&client_id=\(APIKeys.clientID)&client_secret=\(APIKeys.clientSecret)&v=\(date)&query=\(keyword)"
        } else {
            url = "https://api.foursquare.com/v2/venues/search?ll=\(location)&client_id=\(APIKeys.clientID)&client_secret=\(APIKeys.clientSecret)&v=\(date)"
        }
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad URL"), nil)
            }
            if let data = data {
                do{
                    let vanueData = try JSONDecoder().decode(Venue.self, from: data)
                    completionHandler(appError, vanueData.response.venues)
                }catch{
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    static func searchForVenueAnyLocation(location: String, keyword: String,date: String, completionHandler: @escaping(AppError?,[VenueDetails]?)-> Void) {
        let location = location.replacingOccurrences(of: " ", with: "")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/search?near=\(location)&client_id=\(APIKeys.clientID)&client_secret=\(APIKeys.clientSecret)&v=\(date)&query=\(keyword)") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad URL"), nil)
            }
            if let data = data {
                do{
                    let vanueData = try JSONDecoder().decode(Venue.self, from: data)
                    completionHandler(appError, vanueData.response.venues)
                }catch{
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }

}
