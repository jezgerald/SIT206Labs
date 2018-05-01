//
//  TripAnnotation.swift
//  Lab5
//
//  Created by Jessica Fitzgerald on 1/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import Foundation
import MapKit

class TripAnnotation : NSObject, MKAnnotation {
    var tripID : Int
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var img : UIImage?
    
    init(tripID : Int, trip: Trip, coordinate : CLLocationCoordinate2D) {
        self.tripID = tripID
        self.title = trip.tripDestination
        self.subtitle = "\(trip.tripDate)"
        self.coordinate = coordinate
        self.img = trip.img
        
    }
    
}
