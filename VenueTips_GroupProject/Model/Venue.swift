//
//  Venue.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

struct Venue: Codable {
  let response: VenueInfo
}

struct VenueInfo: Codable {
  let venues: [VenueDetails]
}

struct VenueDetails: Codable {
  let id: String
  let name: String
  let location: LocationInfo
  let categories: [CategoryInfo]
  
}

struct LocationInfo: Codable {
  let address: String?
  let crossStreet: String?
  let lat: Double
  let lng: Double
  let distance: Int?
  let postalCode: String?
  let cc: String
  let city: String?
  let state: String?
  let country: String
  let formattedAddress: [String]
}
struct CategoryInfo: Codable {
  let name: String
  let pluralName: String
}
