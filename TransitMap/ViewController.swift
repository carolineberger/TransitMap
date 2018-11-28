//
//  ViewController.swift
//  TransitMap
//  Shows a map of London, would be used with
//  API manager to show pins of different colors
//  TODO: this class throws an error, look into error
// 2018-11-27 20:42:44.931123-0500 TransitMap[28199:3353057] Could not inset legal attribution from corner 4
//  Created by Caroline Berger on 26/11/2018.
//  Copyright © 2018 Caroline Berger. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView! //this is connected to the storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This is a sample map of London from on online tutorial
        
        
        let location = CLLocationCoordinate2D(latitude: 51.50007773,
                                              longitude: -0.1246402)
        // Longitude and Latitude are of type Double
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        

        // the annotation would be set to the image file from the email
        let annotation = MKPointAnnotation() //these will be the pins
        annotation.coordinate = location
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
 
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

