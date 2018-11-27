//
//  APIManager.swift
//  TransitMap
//
//  Created by Caroline Berger on 27/11/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import Foundation
let url  = URL(string: "https://api.transitapp.com/v3/feeds?detailed=1")!
//func getFeeds()-> FeedList{
func getFeeds() {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
            error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return }
        do{
            //here dataResponse received from a network request
            let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse, options: [])
            print(jsonResponse) //Response result
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
    task.resume()
    

    
}
