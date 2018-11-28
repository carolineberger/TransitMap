//
//  Feed.swift
//  TransitMap
//  The feed class has the country code, the city,
//  the pin color and bounds

// TODO: add feed name
//
//  Created by Caroline Berger on 26/11/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import Foundation

class Feed {
    // var name: String?
    var countryCode: String
    var city: String?
    var pinColor: String
    var bounds: Bounds
    
    init(countryCode: String, city: String?, bounds:Dictionary<String, Double>){
        
        self.countryCode = countryCode
        self.city = city
        
        self.bounds = Bounds(min_lat: bounds["min_lat"]!,max_lat: bounds["max_lat"]!, min_lon: bounds["max_lat"]!, max_lon: bounds ["max_lon"]! )
        
        /*  depending on what country code the feed is, there is a different
            pin color
        */
        switch countryCode{
        case "CA":
            self.pinColor = "f44336"
        case "US":
            self.pinColor = "e040fb"
        case "FR":
            self.pinColor = "3f51b5"
        case "GB":
            self.pinColor = "8bc34a"
        case "DE":
            self.pinColor = "ffc107"
        default:
            self.pinColor = "00bcd4"
            
        }
    }
    
    
    class Bounds {
        var min_lat: Double
        var max_lat: Double
        var min_lon: Double
        var max_lon: Double
        init(min_lat:Double, max_lat:Double, min_lon:Double,
             max_lon:Double){
            self.min_lat = min_lat;
            self.max_lat = max_lat;
            self.min_lon = min_lon;
            self.max_lon = max_lon;
            
        }
    }
 
}


