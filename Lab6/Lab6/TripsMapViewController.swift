//
//  TripsMapViewController.swift
//  Lab5
//
//  Created by Jessica Fitzgerald on 29/4/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import MapKit

class TripsMapViewController: UIViewController, LocationObserver, MKMapViewDelegate {

    @IBOutlet weak var tripsMap: MKMapView!
    
    var trips = Trips.getTrips()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // set mapkitview delegate to the TripsMapViewController
        tripsMap.delegate = self
        
        //show the user's location
        tripsMap.showsUserLocation = true
        
        // centre map around user location
        tripsMap.setCenter(tripsMap.userLocation.coordinate, animated: true)
        
        // add a pin for each trip
        for i in 0 ... Utilities.trips.count - 1 {
            let trip = Utilities.trips[i]
            
            CLGeocoder().geocodeAddressString(trip.tripDestination, completionHandler: { (placeMark, error) in
                let tripLocation = placeMark![0].location?.coordinate
                self.tripsMap.addAnnotation(TripAnnotation(tripID: i, trip: trip, coordinate: tripLocation!))
                })
        }
        
        LocationService.shared.registerLocationObserver(locationObserver: self)
    }
    
    func locationDidChange(newLocations: [CLLocation]) {
        self.tripsMap.setCenter(newLocations[0].coordinate, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let pinIdentifier = "tripPin"
        var pin = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdentifier)
        
        let trip = (annotation as! Trip)
        if pin == nil {
            pin = MKAnnotationView(annotation: annotation, reuseIdentifier: pinIdentifier)
            
            pin?.image = trip.img
            let btn = UIButton(type: .detailDisclosure)
            pin?.rightCalloutAccessoryView = btn
            pin?.canShowCallout = true
        }
        else {
            pin?.annotation = annotation
        }
        return pin
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let selectedTrip = Utilities.trips[ (view.annotation as! TripAnnotation).tripID]
        
        let tripInfoVC = (self.storyboard?.instantiateInitialViewController(withIdentifier: "tripInfo") as! TblViewControllerTripInfo)
        
        tripInfoVC.trip = selectedTrip
        
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
