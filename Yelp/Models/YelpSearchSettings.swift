//
//  YelpSearchSettings.swift
//  Yelp
//
//  Created by Liem Ly Quan on 10/19/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import Foundation

class YelpSearchSettings {
    var categories:[String] = []
    var deals:Bool = false
    var distance: Double = 40000
    var sortBy: YelpSortMode = .bestMatched
    var location: String = "37.785771,-122.406165"
    
    static let sharedInstance = YelpSearchSettings()
}
