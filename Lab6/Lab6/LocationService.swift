//
//  LocationService.swift
//  Lab6
//
//  Created by Jessica Fitzgerald on 2/6/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import Foundation
import MapKit

protocol LocationObserver {
    func locationDidChange(newLocations : [CLLocation])
}

class LocationService : NSObject, CLLocationManagerDelegate {
    var locationObservers : [LocationObserver] = []
    var locationManager = CLLocationManager.init()
    static let shared: LocationService = LocationService()
    
    override private init() {
        super.init()
        locationManager.desiredAccuracy = 100 // metres
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func registerLocationObserver(locationObserver : LocationObserver) {
        locationObservers.append(locationObserver)
    }
    
    func locationManager(_ manager : CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        // notify all observers with the new change
        for observer in locationObservers {
            observer.locationDidChange(newLocations: locations)
        }
    }
    
}
