//
//  APIManager.swift
//  TransitMap
//  APIManager has one function called
//  getsFeed which gets the countrycode, city, pincolor and
//  geographical bounds of a feed
//  from JSON url and formats the information
//  accoding to the class Feed
//
//  TODO: closure issue on the feeds return
//
//  Created by Caroline Berger on 27/11/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import Foundation

let url  = URL(string: "https://api.transitapp.com/v3/feeds?detailed=1")!

/*  TODO: should return an array of Feeds that are filled in
    but because of a closure issue, the varialbe feeds is
    returned empty
 */
func getFeeds() -> [Feed] {
    var feeds:[Feed] = [] //this has a closure issue

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
            error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
                
        }
        do  {
            let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse, options: []) as! Dictionary<String, AnyObject>
            
            // bad design that feeds is hard coded
            let robustListOfFeeds = jsonResponse["feeds"] as! [Dictionary<String, AnyObject>]
            /* the list of feeds from the JSON is robust,
                it has a lot of information we don't need
                so we have our own feed class for all the information
                we do need
            */
            
            for robustFeed in robustListOfFeeds {
                /*  create feed objects and put them into the array
                    This is a bit messy as the types are
                    being forced to cast down, I think there is a
                    a better solution using Codable structs, but
                    I wasn't able to figure that out
                */
                let feed = Feed(
                    countryCode: (robustFeed["country_code"] as? String)!,
                    city: robustFeed["location"] as? String, bounds: (robustFeed["bounds"] as? Dictionary<String, Double>)!)
                
                feeds.append(feed)
            }
            
        }
        catch let parsingError {
            print("Error", parsingError)
        }
    }
    task.resume()
    return feeds
}
