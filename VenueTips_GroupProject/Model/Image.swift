//
//  Image.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/10/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct Image: Codable {
  let response: PhotoInfo
}

struct PhotoInfo: Codable {
  let photos: Photos
}

struct Photos: Codable {
  let items: [PhotoDetails]?
}

struct PhotoDetails: Codable {
  let id: String
  let createdAt: Int
  let prefix: String //URL
  let suffix: String
  let width: Int
  let height: Int
//  let visibility: String
}


/*
 https://developer.foursquare.com/docs/api/photos/details
 To assemble a photo URL, combine the response’sprefix + size + suffix. Ex: https://igx.4sqi.net/img/general/300x500/5163668_xXFcZo7sU8aa1ZMhiQ2kIP7NllD48m7qsSwr1mJnFj4.jpg
 
 size can be one of the following, where XX or YY is one of 36, 100, 300, or 500.
 
 XXxYY
 original: the original photo’s size
 capXX: cap the photo with a width or height of XX. (whichever is larger). Scales the other, smaller dimension proportionally
 widthXX: forces the width to be XX and scales the height proportionally
 heightYY: forces the height to be YY and scales the width proportionally

 */
