//
//  VenueAPIClient.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct VenueAPIClient {
    static func searchForVenueNearBy(location: String,completionHandler: @escaping (AppError?, [VenueDetails]?) -> Void){
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.foursquare.com/v2/venues/search?ll=\(location)&client_id=H02XVB2YYM3PCYFESXBGEFFI0A15HOYTK2BHLZBCHSUHUTVH&client_secret=XQGJPPQK51FL4YZRG412AMGU03PVZHPSCJHMVE5IAOXNCZGD&v=20190208") { (appError, data) in
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
