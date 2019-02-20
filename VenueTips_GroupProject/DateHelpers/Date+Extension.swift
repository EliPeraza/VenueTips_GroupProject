//
//  Date+Extension.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/8/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

extension Date {
    // get an ISO timestamp
    //example let timeStamp = Date().getISOTimestamp() - for my favorite books sorting
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
    
}

struct DateHelper {
    static func formatISOToDate(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        
//        let date = isoDateFormatter.string(from: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyyMMdd"
        
        
        return dateFormatter.string(from: Date())
    }
}
