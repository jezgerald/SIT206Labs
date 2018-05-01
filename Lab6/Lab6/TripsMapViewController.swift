//
//  TripsMapViewController.swift
//  Lab5
//
//  Created by Jessica Fitzgerald on 29/4/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit
import MapKit

class TripsMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var tripsMap: MKMapView!
    
    var trips = Trips.getTrips()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tripsMap.delegate = self
        tripsMap.showsUserLocation = true
        
        for trip in trips {
            tripsMap.addAnnotation(trip)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let pinIdentifier = "tripPin"
        var pin = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdentifier)
        
        let trip = (annotation as! Trip)
        if pin == nil {
            pin = MKAnnotationView(annotation: annotation, reuseIdentifier: pinIdentifier)
            
            pin?.image = trip.img
            pin?.canShowCallout = true
        }
        else {
            pin?.annotation = annotation
        }
        return pin
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
