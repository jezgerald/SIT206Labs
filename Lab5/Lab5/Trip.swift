//
//  Trip.swift
//  TripAdvisor App
//
//  Created by Mohamed Abdelrazek on 16/4/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import Foundation
import UIKit

class Trip {
    var tripDate : Date
    var tripDuration : Int
    var tripDestination : String
    var destinationImage : UIImage
    
    init(date : Date, duration : Int, destination : String, img : UIImage) {
        self.tripDate = date
        self.tripDuration = duration
        self.tripDestination = destination
        self.destinationImage = img
    }
}

class Utilities {
    static var dateFormat = DateFormatter()
    static var trips : [Trip] = []
    static func loadTrips() {
        dateFormat.dateFormat = "yy/mm/dd"
        trips = [
            Trip(date: dateFormat.date(from: "17/04/24")!, duration: 2, destination: "Melbourne", img: UIImage(named: "melbourne")!),
            Trip(date: dateFormat.date(from: "18/04/20")!, duration: 3, destination: "Sydney", img: UIImage(named: "sydney")!)
        ]
    }
}

/*
class Trips {
    static var trips = [Trip]()
    static var viewContext : NSManagedObjectContext?
    
    static func getViewContext() -> NSManagedObjectContext {
        if viewContext == nil {
           viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        }
        return viewContext!
    }
    static func getTrips() -> [Trip] {
        if trips.count == 0 { loadTrips() }
        return trips
    }
    
    static func addTrip(destination : String, duration : Int16, date : String, img : UIImage) {
        let context = getViewContext()
        var trip = Trip(context: context)
        trip.tripDestination = destination
        trip.img = UIImagePNGRepresentation( img)
        trip.tripDuration = duration
        trip.tripDate = date
        trip.getLocationFromDestination()
        trips.append(trip)
        
        try! context.save()
    }
    
    static func deleteTrip(trip : Trip) {
        let context = getViewContext()
        context.delete(trip)
        
        try! context.save()
    }
    
    static func getTrip(at : Int) -> Trip? {
        if trips.count < 1 { loadTrips() }
        
        if at >= 0 && at < trips.count {
            return trips[at]
        }
        return nil
    }
    static func loadTrips() {
        let context = getViewContext()
        trips = try! context.fetch(Trip.fetchRequest())
        
        /*
        if trips.count == 0 {
            
            //Add a trip to Melbourne
            var trip = Trip(context: context)
            trip.tripDestination = "Melbourne"
            trip.img = UIImagePNGRepresentation( UIImage(named : "Melbourne")!)
            trip.tripDuration = 3
            trip.tripDate = "2018/10/10"
            trip.getLocationFromDestination()
            trips.append(trip)
            
            //Add a trip to Sydney
            trip = Trip(context: context)
            trip.tripDestination = "Sydney"
            trip.img = UIImagePNGRepresentation( UIImage(named : "Sydney")!)
            trip.tripDuration = 6
            trip.tripDate = "2016/10/24"
            trip.getLocationFromDestination()
            trips.append(trip)
            
            //Add a trip to Adelaide
            trip = Trip(context: context)
            trip.tripDestination = "Melbourne"
            trip.img = UIImagePNGRepresentation( UIImage(named : "Adelaide")!)
            trip.tripDuration = 13
            trip.tripDate = "2017/12/10"
            trip.getLocationFromDestination()
            trips.append(trip)
            
            //Save the trips to the data store
            try! context.save()
            
        }
        */
    
    }
    
}
*/
