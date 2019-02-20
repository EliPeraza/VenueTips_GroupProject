//
//  DataManager.swift
//  VenueTips_GroupProject
//
//  Created by Elizabeth Peraza  on 2/13/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation



struct DataManager {
    static private var categories = [CategoryToSave]()
    static private var venues = [Venue]()
    static private var tips = [VenueTip]()
    static var tipsFileName = "tipsFileName.plist"
    static var categoriesFileName = "categoriesFileName.plist"
}

extension DataManager {
    
    static func saveCategory(fileName: String) {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName)
        do {
            let data = try PropertyListEncoder().encode(categories)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property List and Encoding Error: \(error)")
        }
    }
    
    static func addCatergory(fileName: String, category: CategoryToSave) {
        categories.append(category)
        saveCategory(fileName: fileName)
    }
    
    static func getCategories(fileName: String) -> [CategoryToSave] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    categories = try PropertyListDecoder().decode([CategoryToSave].self, from: data)
                } catch {
                    print("Propery List Decoding Error: \(error)")
                }
            } else {
                print("Categories Data is Nil")
            }
        } else {
            print("\(fileName) does not Exist")
        }
        return categories
    }
}

extension DataManager {
    
    static func saveVenues(venueName: String) {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: venueName)
        do {
            let data = try PropertyListEncoder().encode(venues)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property List and Encoding Error: \(error)")
        }
    }
    
    static func addVenue(categoryName: String, venue: Venue) {
        venues.append(venue)
        saveVenues(venueName: categoryName)
    }
    
    static func getVenues(categoryName: String) -> [Venue] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: categoryName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    venues = try PropertyListDecoder().decode([Venue].self, from: data)
                } catch {
                    print("Propery List Decoding Error: \(error)")
                }
            } else {
                print("Categories Data is Nil")
            }
        } else {
            print("\(categoryName) does not Exist")
        }
        return venues
    }
}

extension DataManager {
    
    static func saveTip(tipComment: String) {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: tipComment)
        do {
            let data = try PropertyListEncoder().encode(tips)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property List and Encoding Error: \(error)")
        }
    }
    
    static func addTip (tipComment: String, tip: VenueTip) {
        tips.append(tip)
        saveTip(tipComment: tipComment)
    }
    
    static func getTips(tipComment: String) -> [VenueTip] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: tipComment).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    tips = try PropertyListDecoder().decode([VenueTip].self, from: data)
                } catch {
                    print("Propery List Decoding Error: \(error)")
                }
            } else {
                print("Categories Data is Nil")
            }
        } else {
            print("\(tipComment) does not Exist")
        }
        return tips
    }
}

