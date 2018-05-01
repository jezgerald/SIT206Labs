//
//  Trip.swift
//  TripAdvisor App
//
//  Created by Mohamed Abdelrazek on 16/4/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit
import CoreData


/*class Trip //: NSManagedObject, MKAnnotation
{
     var tripDate : Date
     var tripDuration : Int
     var tripDestination : String
     var destinationImage : UIImage

    init(date : Date, duration : Int, destination : String, img : UIImage)
     {
        self.tripDate = date
        self.tripDestination = destination
        self.tripDuration = duration
        self.destinationImage = img
     }

     var title : String?
     var subTitle : String?
     var coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)

    /*
     func getLocationFromDestination() {
         CLGeocoder().geocodeAddressString(tripDestination!) {
         (placemarks, error) in
         let placemark = placemarks?.first
         self.coordinate = (placemark?.location?.coordinate)!
        }
     }
     */
 }
*/

class Utilities {
    static var dateFormatter = DateFormatter()
    static var trips : [Trip] = []
    static func loadTrips() {
        dateFormatter.dateFormat = "yy/mm/dd"
        trips = [
            Trip(date : dateFormatter.date(from : "17/04/24")!, duration : 2, destination : "Melbourne", img : UIImage(named: "melbourne")!),
            Trip(date : dateFormatter.date(from : "17/05/24")!, duration : 2, destination : "Sydney", img : UIImage(named: "sydney")!)
        ]
    }
}


class Trip : NSObject, MKAnnotation {
    var title : String?
    var subTitle : String?
    var tripDestination : String
    var tripDuration : Int
    var tripDate : String
    var img : UIImage
    var coordinate : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    init(_ destination : String,_ duration : Int, _ date : String, _ image : UIImage )
    {
        tripDestination = destination
        tripDuration = duration
        tripDate = date
        img  = image
        
        super.init()
        updateTripData()
    }
    func updateTripData() {
        title = tripDestination
        subTitle = tripDate
        getLocationFromDestination()
    }
    func getLocationFromDestination() {
        CLGeocoder().geocodeAddressString(tripDestination) {
            (placemarks, error) in
            let placemark = placemarks?.first
            self.coordinate = (placemark?.location?.coordinate)!
        }
    }
}


class Trips {
    static var trips = [Trip]()
    
    static func getTrips() -> [Trip] {
        if trips.count == 0 { loadTrips() }
        return trips
    }
    
    static func addTrip(destination : String, duration : Int16, date : String, img : UIImage) {
    }
    
    static func getTrip(at : Int) -> Trip? {
        if trips.count < 1 { loadTrips() }
        
        if at >= 0 && at < trips.count {
            return trips[at]
        }
        return nil
    }
    static func loadTrips() {
        if trips.count == 0 {
            
            //Add a trip to Melbourne
            trips.append ( Trip(date: "18/10/10", duration: 3, destination: "Melbourne", img: UIImage(named : "melbourne")!))
            
            trips.append ( Trip(date: "18/08/10", duration: 13, destination: "Sydney", img: UIImage(named : "sydney")!))
            
            trips.append (Trip(date: "17/08/10", duration: 10, destination: "Adelaide", img: UIImage(named : "adelaide")!))
            
        }
        
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
