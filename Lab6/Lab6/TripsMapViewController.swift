//
//  TripsMapViewController.swift
//  Lab6
//
//  Created by Jessica Fitzgerald on 2/6/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import MapKit

class TripsMapViewController: UIViewController, MKMapViewDelegate, LocationObserver {

    @IBOutlet weak var tripsMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // load trips from Utilities class
        Utilities.loadTrips()
        
        // set mapkit delegate to the TripsMapViewController
        self.tripsMap.delegate = self
        
        // centre the map around the user's current location
        tripsMap.setCenter(tripsMap.userLocation.coordinate, animated: true)
        
        // register viewController with LocationService
        LocationService.shared.registerLocationObserver(locationObserver: self)
        
        // Add a pin to the map for each trip
        for i in 0 ... Utilities.trips.count - 1 {
            let trip = Utilities.trips[i]
            
            // CLGeocoder convers trip destination to coordinates
            CLGeocoder().geocodeAddressString(trip.tripDestination, completionHandler: { (placeMark, error) in
            let tripLocation = placeMark![0].location?.coordinate
            self.tripsMap.addAnnotation(TripAnnotation(tripID: i, trip: trip, coordinate: tripLocation!))
            })
        }
    }
    
    func locationDidChange(newLocations: [CLLocation]) {
        self.tripsMap.setCenter(newLocations[0].coordinate, animated: true)
    }

    func mapView(_ mapView : MKMapView, viewFor annotation : MKAnnotation) -> MKAnnotationView? {
        // get ID of the annotationView
        let reuseID = "tripAnnotation"
        
        // if the annotation to view is not TripAnnotation, don't continue
        let tripAnnotation : TripAnnotation? = (annotation as? TripAnnotation)
        if tripAnnotation == nil {
            return nil
        }
        
        // get a reusable AnnotationView item
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        
        // if nil, then it's the first time using this annotation
        if annotationView == nil {
            // create a new object, set the image, and add a button to show more details
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            annotationView?.image = tripAnnotation?.img
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            annotationView?.canShowCallout = true
        }
        else {
            annotationView!.annotation = tripAnnotation
        }
        
        return annotationView
    }
    
    func mapView (_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // get the selected annotationView, get the annotation included, and get the tripID
        let selectedTrip = Utilities.trips[ (view.annotation as! TripAnnotation).tripID ]
        
        // init the tripInfo viewController. TripInfo is the viewController ID so you need to select the trip info screen and set its identifier
        let tripInfoVC = (self.storyboard?.instantiateViewController(withIdentifier: "tripInfo") as! TblViewControllerTripInfo)
        
        // no pass the selectTrip
        tripInfoVC.trip = selectedTrip
        
        // show trip info screen
        self.present(tripInfoVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
