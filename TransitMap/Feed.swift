//
//  Feed.swift
//  TransitMap
//
//  Created by Caroline Berger on 26/11/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import Foundation

struct Feed: Codable {
    let country_code: String
    let pinColor: String?
    let name: String
    let location: String
    let bounds: [Bounds]
    
    struct Bounds: Codable {
        let min_lat: Double
        let max_lat: Double
        let min_lon: Double
        let max_lon: Double
    }
}

struct FeedList: Codable{
    let feeds :[Feed]
}
