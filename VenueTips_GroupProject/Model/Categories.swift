//
//  Categories.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/13/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct Categories: Codable {
  let response: CategoriesInfo
}

struct CategoriesInfo: Codable {
  let categories: [CategoriesDetails]
}

struct CategoriesDetails: Codable {
  let id: String
  let name: String
}
