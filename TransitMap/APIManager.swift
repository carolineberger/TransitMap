//
//  APIManager.swift
//  TransitMap
//
//  Created by Caroline Berger on 27/11/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import Foundation

// https://jsonformatter.curiousconcept.com/ good tool to visual JSON

let url  = URL(string: "https://api.transitapp.com/v3/feeds?detailed=1")!

func getFeeds()-> [Feed] {
    
    var feeds: [Feed] = []
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
            error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return }
        do{
            let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse, options: []) as! Dictionary<String, AnyObject>
            
            let robustListOfFeeds = jsonResponse["feeds"] as! [Dictionary<String, AnyObject>]
            
            for robustFeed in robustListOfFeeds {
                // fill feed struct
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
