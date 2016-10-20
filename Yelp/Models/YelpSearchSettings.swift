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
    static let sharedInstance = YelpSearchSettings()
}
